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

   400665:	eb 01                	jmp    400668 <main+0x3>
   400667:	b0 55                	mov    al,0x55
   400669:	eb 01                	jmp    40066c <main+0x7>
   40066b:	b4 48                	mov    ah,0x48
   40066d:	89 e5                	mov    ebp,esp
   40066f:	eb 01                	jmp    400672 <main+0xd>
   400671:	b4 48                	mov    ah,0x48
   400673:	83 ec 20             	sub    esp,0x20
   400676:	eb 01                	jmp    400679 <main+0x14>
   400678:	b0 89                	mov    al,0x89
   40067a:	7d ec                	jge    400668 <main+0x3>
   40067c:	eb 01                	jmp    40067f <main+0x1a>
   40067e:	0c 48                	or     al,0x48
   400680:	89 75 e0             	mov    DWORD PTR [rbp-0x20],esi
   400683:	eb 01                	jmp    400686 <main+0x21>
   400685:	0c c7                	or     al,0xc7
   400687:	45 fc                	rex.RB cld    
   400689:	2f                   	(bad)  
   40068a:	d3 23                	shl    DWORD PTR [rbx],cl
   40068c:	00 eb                	add    bl,ch
   40068e:	01 24 8b             	add    DWORD PTR [rbx+rcx*4],esp
   400691:	45 fc                	rex.RB cld    
   400693:	eb 01                	jmp    400696 <main+0x31>
   400695:	b4 89                	mov    ah,0x89
   400697:	c7                   	(bad)  
   400698:	eb 01                	jmp    40069b <main+0x36>
   40069a:	b0 e8                	mov    al,0xe8
   40069c:	44 fe                	rex.R (bad)  
   40069e:	ff                   	(bad)  
   40069f:	ff eb                	jmp    <internal disassembler error>
   4006a1:	01 b4 89 45 fc eb 01 	add    DWORD PTR [rcx+rcx*4+0x1ebfc45],esi
   4006a8:	b0 b8                	mov    al,0xb8
   4006aa:	fc                   	cld    
   4006ab:	07                   	(bad)  
   4006ac:	40 00 eb             	add    bl,bpl
   4006af:	01 24 8b             	add    DWORD PTR [rbx+rcx*4],esp
   4006b2:	55                   	push   rbp
   4006b3:	fc                   	cld    
   4006b4:	eb 01                	jmp    4006b7 <main+0x52>
   4006b6:	b0 89                	mov    al,0x89
   4006b8:	d6                   	(bad)  
   4006b9:	eb 01                	jmp    4006bc <main+0x57>
   4006bb:	b0 48                	mov    al,0x48
   4006bd:	89 c7                	mov    edi,eax
   4006bf:	eb 01                	jmp    4006c2 <main+0x5d>
   4006c1:	0c b8                	or     al,0xb8
   4006c3:	00 00                	add    BYTE PTR [rax],al
   4006c5:	00 00                	add    BYTE PTR [rax],al
   4006c7:	eb 01                	jmp    4006ca <main+0x65>
   4006c9:	b0 e8                	mov    al,0xe8
   4006cb:	11 fd                	adc    ebp,edi
   4006cd:	ff                   	(bad)  
   4006ce:	ff eb                	jmp    <internal disassembler error>
   4006d0:	01 b4 83 45 fc 04 eb 	add    DWORD PTR [rbx+rax*4-0x14fb03bb],esi
   4006d7:	01 b4 b8 0e 08 40 00 	add    DWORD PTR [rax+rdi*4+0x40080e],esi
   4006de:	eb 01                	jmp    4006e1 <main+0x7c>
   4006e0:	24 8b                	and    al,0x8b
   4006e2:	55                   	push   rbp
   4006e3:	fc                   	cld    
   4006e4:	eb 01                	jmp    4006e7 <main+0x82>
   4006e6:	b0 89                	mov    al,0x89
   4006e8:	d6                   	(bad)  
   4006e9:	eb 01                	jmp    4006ec <main+0x87>
   4006eb:	0c 48                	or     al,0x48
   4006ed:	89 c7                	mov    edi,eax
   4006ef:	eb 01                	jmp    4006f2 <main+0x8d>
   4006f1:	0c b8                	or     al,0xb8
   4006f3:	00 00                	add    BYTE PTR [rax],al
   4006f5:	00 00                	add    BYTE PTR [rax],al
   4006f7:	eb 01                	jmp    4006fa <main+0x95>
   4006f9:	24 e8                	and    al,0xe8
   4006fb:	e1 fc                	loope  4006f9 <main+0x94>
   4006fd:	ff                   	(bad)  
   4006fe:	ff eb                	jmp    <internal disassembler error>
   400700:	01 b0 c9 eb 01 b4    	add    DWORD PTR [rax-0x4bfe1437],esi
   400706:	c3                   	ret    

