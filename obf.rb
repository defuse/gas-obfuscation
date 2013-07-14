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
  # These are instruction prefixes. They all make the disassembler expect the
  # next byte(s) (the first byte(s) of the actual instruction) to be part of
  # this instruction.
  "\xB0".b,                     # MOV AL, <imm8>
  "\xB4".b,                     # MOV AH, <imm8>
  "\x0C".b,                     # OR AL, <imm8>
  "\x24".b,                     # AND AL, <imm8>
  # You can add more, or even mine them from existing binaries...
]

output = []

lines.each do |line|
  if /^\s*\./ =~ line || /:$/ =~ line
    # it's a dot thing or label, ignore
    output << line
  elsif /^*.*\s=\s.*$/ =~ line
    # it's something like "Lset9 = Ltmp2-Leh_func_begin2" ignore it
    output << line
  elsif /^\s*$/ =~ line
    # blank line, ignore it
    output << line
  else 
    # it's an instruction (i think!), so insert obfuscator
    obf = OBFUSCATORS[rand(OBFUSCATORS.length)]
              # unconditional jump over the instruction prefix
    output << ".byte 0xEB, #{obf.length}, " +
              # the instruction prefix
              obf.split('').map { |b| b.ord }.join(', ') + "\n"
    output << line
  end
end

print output.join('');
exit 0
