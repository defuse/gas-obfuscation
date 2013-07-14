#!/usr/bin/env ruby

# This script obfuscates GCC assembly files such that linear sweep disassemblers
# (like objdump) will get the disassembly completely wrong. On my machine,
# obfuscated binaries are about 1.5 times slower (50% overhead). This is a very
# naive method, though, and there's plenty of room for optimization.
#
# You can use it to obfuscate C code like this...
#   gcc -c -S test.c -o test.s
#   ruby obf.rb test.s > testobf.s
#   gcc -c testobf.s -o testobf.o
#   gcc testobf.o -o testobf
#
# This work was inspired by this paper:
# "Obfuscation of Executable Code to Improve Resistance to Static Disassembly"
#    by Cullen Linn and Saumya Debray


if ARGV.length != 1
  puts "Usage: obf.rb input.s"
  exit 1
end

INPUT_FILE = ARGV[0]

lines = File.open( INPUT_FILE, "r" ) do |f|
  f.readlines
end

OBFUSCATORS = [
  # These are instruction prefixes...
  "\x05".b,                     # ADD EAX, <imm32>
  "\x81\xC3".b,                 # ADD EBX, <imm32>
  "\x31".b,                     # XOR
  "\xF7".b,                     # MUL
  "\x0D".b,                     # OR EAX, <imm32>
  # You can add more, or even mine them from existing binaries...
]

output = []

STATE_WAITING_FOR_TEXT = 0
STATE_OBFUSCATING = 1
state = STATE_WAITING_FOR_TEXT

lines.each do |line|
  case state
  when STATE_WAITING_FOR_TEXT
    if /^\s*\.text$/ =~ line
      state = STATE_OBFUSCATING
    end
    output << line
  when STATE_OBFUSCATING
    if /^\s*\./ =~ line || /:$/ =~ line
      # it's a dot thing or label, ignore
      output << line
    else 
      # it's an instruction (i think!), so insert obfuscator
      obf = OBFUSCATORS[rand(OBFUSCATORS.length)]
                # unconditional jump over the instruction prefix
      output << ".byte 0xEB, 0x#{obf.length.to_s(16)}, " +
                # the instruction prefix
                obf.split('').map { |b| b.ord }.join(', ') + "\n"
      output << line
    end
  end
end

print output.join('');
exit 0
