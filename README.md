gas-obfuscation
===============

Extremely simple but inefficient x86-64 assembly obfuscation.

Look at obf.rb to see how it works. Run that script on GAS assembly (.s) files.

Example Output
----------------

### Normal

    4005d2:       55                      push   rbp
    4005d3:       48 89 e5                mov    rbp,rsp
    4005d6:       48 83 ec 20             sub    rsp,0x20
    4005da:       89 7d ec                mov    DWORD PTR [rbp-0x14],edi
    4005dd:       48 89 75 e0             mov    QWORD PTR [rbp-0x20],rsi
    4005e1:       c7 45 fc 2f d3 23 00    mov    DWORD PTR [rbp-0x4],0x23d32f
    4005e8:       8b 45 fc                mov    eax,DWORD PTR [rbp-0x4]
    4005eb:       89 c7                   mov    edi,eax
    4005ed:       e8 f2 fe ff ff          call   4004e4 <foo>
    4005f2:       89 45 fc                mov    DWORD PTR [rbp-0x4],eax
    4005f5:       b8 1c 07 40 00          mov    eax,0x40071c
    4005fa:       8b 55 fc                mov    edx,DWORD PTR [rbp-0x4]
    4005fd:       89 d6                   mov    esi,edx
    4005ff:       48 89 c7                mov    rdi,rax
    400602:       b8 00 00 00 00          mov    eax,0x0
    400607:       e8 d4 fd ff ff          call   4003e0 <printf@plt>
    40060c:       83 45 fc 04             add    DWORD PTR [rbp-0x4],0x4
    400610:       b8 2e 07 40 00          mov    eax,0x40072e
    400615:       8b 55 fc                mov    edx,DWORD PTR [rbp-0x4]
    400618:       89 d6                   mov    esi,edx
    40061a:       48 89 c7                mov    rdi,rax
    40061d:       b8 00 00 00 00          mov    eax,0x0
    400622:       e8 b9 fd ff ff          call   4003e0 <printf@plt>
    400627:       c9                      leave  
    400628:       c3                      ret 


### Obfuscated

    40066c:       eb 01                   jmp    40066f <main+0x3>
    40066e:       05 55 eb 01 05          add    eax,0x501eb55
    400673:       48 89 e5                mov    rbp,rsp
    400676:       eb 02                   jmp    40067a <main+0xe>
    400678:       81 c3 48 83 ec 20       add    ebx,0x20ec8348
    40067e:       eb 01                   jmp    400681 <main+0x15>
    400680:       05 89 7d ec eb          add    eax,0xebec7d89
    400685:       01 0d 48 89 75 e0       add    DWORD PTR [rip+0xffffffffe0758948],ecx        # ffffffffe0b58fd3 <_end+0xffffffffe05584c3
    
    40068b:       eb 01                   jmp    40068e <main+0x22>
    40068d:       31 c7                   xor    edi,eax
    40068f:       45 fc                   rex.RB cld    
    400691:       2f                      (bad)  
    400692:       d3 23                   shl    DWORD PTR [rbx],cl
    400694:       00 eb                   add    bl,ch
    400696:       01 0d 8b 45 fc eb       add    DWORD PTR [rip+0xffffffffebfc458b],ecx        # ffffffffec3c4c27 <_end+0xffffffffebdc4117>
    40069c:       01 31                   add    DWORD PTR [rcx],esi
    40069e:       89 c7                   mov    edi,eax
    4006a0:       eb 01                   jmp    4006a3 <main+0x37>
    4006a2:       f7 e8                   imul   eax
    4006a4:       3c fe                   cmp    al,0xfe
    4006a6:       ff                      (bad)  
    4006a7:       ff eb                   jmp    <internal disassembler error>
    4006a9:       01 f7                   add    edi,esi
    4006ab:       89 45 fc                mov    DWORD PTR [rbp-0x4],eax
    4006ae:       eb 01                   jmp    4006b1 <main+0x45>
    4006b0:       05 b8 0c 08 40          add    eax,0x40080cb8
    4006b5:       00 eb                   add    bl,ch
    4006b7:       01 0d 8b 55 fc eb       add    DWORD PTR [rip+0xffffffffebfc558b],ecx        # ffffffffec3c5c48 <_end+0xffffffffebdc5138>
    4006bd:       01 31                   add    DWORD PTR [rcx],esi
    4006bf:       89 d6                   mov    esi,edx
    4006c1:       eb 01                   jmp    4006c4 <main+0x58>
    4006c3:       05 48 89 c7 eb          add    eax,0xebc78948
    4006c8:       01 05 b8 00 00 00       add    DWORD PTR [rip+0xb8],eax        # 400786 <__libc_csu_init+0x56>
    4006ce:       00 eb                   add    bl,ch
    4006d0:       02 81 c3 e8 08 fd       add    al,BYTE PTR [rcx-0x2f7173d]
    4006d6:       ff                      (bad)  
    4006d7:       ff eb                   jmp    <internal disassembler error>
    4006d9:       02 81 c3 83 45 fc       add    al,BYTE PTR [rcx-0x3ba7c3d]
    4006df:       04 eb                   add    al,0xeb
    4006e1:       01 05 b8 1e 08 40       add    DWORD PTR [rip+0x40081eb8],eax        # 4048259f <_end+0x3fe81a8f>
    4006e7:       00 eb                   add    bl,ch
    4006e9:       02 81 c3 8b 55 fc       add    al,BYTE PTR [rcx-0x3aa743d]
    4006ef:       eb 01                   jmp    4006f2 <main+0x86>
    4006f1:       f7                      (bad)  
    4006f2:       89 d6                   mov    esi,edx
    4006f4:       eb 01                   jmp    4006f7 <main+0x8b>
    4006f6:       31 48 89                xor    DWORD PTR [rax-0x77],ecx
    4006f9:       c7                      (bad)  
    4006fa:       eb 01                   jmp    4006fd <main+0x91>
    4006fc:       05 b8 00 00 00          add    eax,0xb8
    400701:       00 eb                   add    bl,ch
    400703:       01 f7                   add    edi,esi
    400705:       e8 d6 fc ff ff          call   4003e0 <printf@plt>
    40070a:       eb 01                   jmp    40070d <main+0xa1>
    40070c:       0d c9 eb 01 0d          or     eax,0xd01ebc9
    400711:       c3                      ret    
