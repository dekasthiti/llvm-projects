// RUN: llvm-mc -triple x86_64-unknown-unknown -x86-asm-syntax=intel -output-asm-variant=1 -mcpu=knl --show-encoding %s | FileCheck %s

// CHECK: vaddps  zmm1 , zmm1, zmmword ptr [rax]
// CHECK: encoding: [0x62,0xf1,0x74,0x48,0x58,0x08]
vaddps zmm1, zmm1, zmmword ptr [rax]

// CHECK: vaddpd  zmm1 , zmm1, zmm2
// CHECK:  encoding: [0x62,0xf1,0xf5,0x48,0x58,0xca]
vaddpd zmm1,zmm1,zmm2

// CHECK: vaddpd  zmm1 {k5}, zmm1, zmm2
// CHECK:  encoding: [0x62,0xf1,0xf5,0x4d,0x58,0xca]
vaddpd zmm1{k5},zmm1,zmm2

// CHECK: vaddpd zmm1 {k5} {z}, zmm1, zmm2
// CHECK:  encoding: [0x62,0xf1,0xf5,0xcd,0x58,0xca]
vaddpd zmm1{k5} {z},zmm1,zmm2

// CHECK: vaddpd zmm1 , zmm1, zmm2, {rn-sae}
// CHECK:  encoding: [0x62,0xf1,0xf5,0x18,0x58,0xca]
vaddpd zmm1,zmm1,zmm2,{rn-sae}

// CHECK: vaddpd zmm1 , zmm1, zmm2, {ru-sae}
// CHECK:  encoding: [0x62,0xf1,0xf5,0x58,0x58,0xca]
vaddpd zmm1,zmm1,zmm2,{ru-sae}

// CHECK:  vaddpd zmm1 , zmm1, zmm2, {rd-sae}
// CHECK:  encoding: [0x62,0xf1,0xf5,0x38,0x58,0xca]
vaddpd zmm1,zmm1,zmm2,{rd-sae}

// CHECK: vaddpd zmm1 , zmm1, zmm2, {rz-sae}
// CHECK:  encoding: [0x62,0xf1,0xf5,0x78,0x58,0xca]
vaddpd zmm1,zmm1,zmm2,{rz-sae}

// CHECK: vcmppd k2 , zmm12, zmm26, 171
// CHECK:  encoding: [0x62,0x91,0x9d,0x48,0xc2,0xd2,0xab]
          vcmppd k2,zmm12,zmm26,0xab

// CHECK: vcmppd k2 {k3}, zmm12, zmm26, 171
// CHECK:  encoding: [0x62,0x91,0x9d,0x4b,0xc2,0xd2,0xab]
          vcmppd k2{k3},zmm12,zmm26,0xab

// CHECK: vcmppd k2 , zmm12, zmm26,{sae}, 171
// CHECK:  encoding: [0x62,0x91,0x9d,0x18,0xc2,0xd2,0xab]
          vcmppd k2,zmm12,zmm26,{sae},0xab

// CHECK: vcmppd k2 , zmm12, zmm26, 123
// CHECK:  encoding: [0x62,0x91,0x9d,0x48,0xc2,0xd2,0x7b]
          vcmppd k2 ,zmm12,zmm26,0x7b

// CHECK: vcmppd k2 , zmm12, zmm26,{sae}, 123
// CHECK:  encoding: [0x62,0x91,0x9d,0x18,0xc2,0xd2,0x7b]
          vcmppd k2,zmm12,zmm26,{sae},0x7b

// CHECK: vcmppd k2 , zmm12, zmmword ptr [rcx], 123
// CHECK:  encoding: [0x62,0xf1,0x9d,0x48,0xc2,0x11,0x7b]
          vcmppd k2,zmm12,zmmword PTR [rcx],0x7b

// CHECK: vcmppd  k2 , zmm12, zmmword ptr [rax + 8*r14 + 291], 123
// CHECK:  encoding: [0x62,0xb1,0x9d,0x48,0xc2,0x94,0xf0,0x23,0x01,0x00,0x00,0x7b]
          vcmppd k2 ,zmm12,zmmword PTR [rax+r14*8+0x123],0x7b

// CHECK: vcmppd  k2 , zmm12, qword ptr [rcx]{1to8}, 123
// CHECK:  encoding: [0x62,0xf1,0x9d,0x58,0xc2,0x11,0x7b]
          vcmppd k2,zmm12,QWORD PTR [rcx]{1to8},0x7b

// CHECK: vcmppd  k2 , zmm12, zmmword ptr [rdx + 8128], 123
// CHECK:  encoding: [0x62,0xf1,0x9d,0x48,0xc2,0x52,0x7f,0x7b]
          vcmppd k2,zmm12,zmmword PTR [rdx+0x1fc0],0x7b

// CHECK: vcmppd  k2 , zmm12, zmmword ptr [rdx + 8192], 123
// CHECK:  encoding: [0x62,0xf1,0x9d,0x48,0xc2,0x92,0x00,0x20,0x00,0x00,0x7b]
          vcmppd k2,zmm12,zmmword PTR [rdx+0x2000],0x7b

// CHECK: vcmppd  k2 , zmm12, zmmword ptr [rdx - 8192], 123
// CHECK:  encoding: [0x62,0xf1,0x9d,0x48,0xc2,0x52,0x80,0x7b]
          vcmppd k2,zmm12,zmmword PTR [rdx-0x2000],0x7b

// CHECK: vcmppd  k2 , zmm12, zmmword ptr [rdx - 8256], 123
// CHECK:  encoding: [0x62,0xf1,0x9d,0x48,0xc2,0x92,0xc0,0xdf,0xff,0xff,0x7b]
          vcmppd k2,zmm12,zmmword PTR [rdx-0x2040],0x7b

// CHECK: vcmppd  k2 , zmm12, qword ptr [rdx + 1016]{1to8}, 123
// CHECK:  encoding: [0x62,0xf1,0x9d,0x58,0xc2,0x52,0x7f,0x7b]
          vcmppd k2,zmm12,QWORD PTR [rdx+0x3f8]{1to8},0x7b

// CHECK: vcmppd  k2 , zmm12, qword ptr [rdx + 1024]{1to8}, 123
// CHECK:  encoding: [0x62,0xf1,0x9d,0x58,0xc2,0x92,0x00,0x04,0x00,0x00,0x7b]
          vcmppd k2,zmm12,QWORD PTR [rdx+0x400]{1to8},0x7b

// CHECK: vcmppd  k2 , zmm12, qword ptr [rdx - 1024]{1to8}, 123
// CHECK:  encoding: [0x62,0xf1,0x9d,0x58,0xc2,0x52,0x80,0x7b]
          vcmppd k2,zmm12,QWORD PTR [rdx-0x400]{1to8},0x7b

// CHECK: vcmppd  k2 , zmm12, qword ptr [rdx - 1032]{1to8}, 123
// CHECK:  encoding: [0x62,0xf1,0x9d,0x58,0xc2,0x92,0xf8,0xfb,0xff,0xff,0x7b]
          vcmppd k2,zmm12,QWORD PTR [rdx-0x408]{1to8},0x7b

// CHECK: vcmpps  k2 , zmm17, zmm22, 171
// CHECK:  encoding: [0x62,0xb1,0x74,0x40,0xc2,0xd6,0xab]
          vcmpps k2,zmm17,zmm22,0xab

// CHECK: vcmpps  k2 {k3}, zmm17, zmm22, 171
// CHECK:  encoding: [0x62,0xb1,0x74,0x43,0xc2,0xd6,0xab]
          vcmpps k2{k3},zmm17,zmm22,0xab

// CHECK: vcmpps  k2 , zmm17, zmm22,{sae}, 171
// CHECK:  encoding: [0x62,0xb1,0x74,0x10,0xc2,0xd6,0xab]
          vcmpps k2,zmm17,zmm22,{sae},0xab

// CHECK: vcmpps  k2 , zmm17, zmm22, 123
// CHECK:  encoding: [0x62,0xb1,0x74,0x40,0xc2,0xd6,0x7b]
          vcmpps k2,zmm17,zmm22,0x7b

// CHECK: vcmpps  k2 , zmm17, zmm22,{sae}, 123
// CHECK:  encoding: [0x62,0xb1,0x74,0x10,0xc2,0xd6,0x7b]
          vcmpps k2,zmm17,zmm22,{sae},0x7b

// CHECK: vcmpps  k2 , zmm17, zmmword ptr [rcx], 123
// CHECK:  encoding: [0x62,0xf1,0x74,0x40,0xc2,0x11,0x7b]
          vcmpps k2,zmm17,zmmword PTR [rcx],0x7b

// CHECK: vcmpps  k2 , zmm17, zmmword ptr [rax + 8*r14 + 291], 123
// CHECK:  encoding: [0x62,0xb1,0x74,0x40,0xc2,0x94,0xf0,0x23,0x01,0x00,0x00,0x7b]
          vcmpps k2,zmm17,zmmword PTR [rax+r14*8+0x123],0x7b

// CHECK: vcmpps  k2 , zmm17, dword ptr [rcx]{1to16}, 123
// CHECK:  encoding: [0x62,0xf1,0x74,0x50,0xc2,0x11,0x7b]
          vcmpps k2,zmm17,DWORD PTR [rcx]{1to16},0x7b

// CHECK: vcmpps  k2 , zmm17, zmmword ptr [rdx + 8128], 123
// CHECK:  encoding: [0x62,0xf1,0x74,0x40,0xc2,0x52,0x7f,0x7b]
          vcmpps k2,zmm17,zmmword PTR [rdx+0x1fc0],0x7b

// CHECK: vcmpps  k2 , zmm17, zmmword ptr [rdx + 8192], 123
// CHECK:  encoding: [0x62,0xf1,0x74,0x40,0xc2,0x92,0x00,0x20,0x00,0x00,0x7b]
          vcmpps k2,zmm17,zmmword PTR [rdx+0x2000],0x7b

// CHECK: vcmpps  k2 , zmm17, zmmword ptr [rdx - 8192], 123
// CHECK:  encoding: [0x62,0xf1,0x74,0x40,0xc2,0x52,0x80,0x7b]
          vcmpps k2,zmm17,zmmword PTR [rdx-0x2000],0x7b

// CHECK: vcmpps  k2 , zmm17, zmmword ptr [rdx - 8256], 123
// CHECK:  encoding: [0x62,0xf1,0x74,0x40,0xc2,0x92,0xc0,0xdf,0xff,0xff,0x7b]
          vcmpps k2,zmm17,zmmword PTR [rdx-0x2040],0x7b

// CHECK: vcmpps  k2 , zmm17, dword ptr [rdx + 508]{1to16}, 123
// CHECK:  encoding: [0x62,0xf1,0x74,0x50,0xc2,0x52,0x7f,0x7b]
          vcmpps k2,zmm17,DWORD PTR [rdx+0x1fc]{1to16},0x7b

// CHECK: vcmpps  k2 , zmm17, dword ptr [rdx + 512]{1to16}, 123
// CHECK:  encoding: [0x62,0xf1,0x74,0x50,0xc2,0x92,0x00,0x02,0x00,0x00,0x7b]
          vcmpps k2,zmm17,DWORD PTR [rdx+0x200]{1to16},0x7b

// CHECK: vcmpps  k2 , zmm17, dword ptr [rdx - 512]{1to16}, 123
// CHECK:  encoding: [0x62,0xf1,0x74,0x50,0xc2,0x52,0x80,0x7b]
          vcmpps k2,zmm17,DWORD PTR [rdx-0x200]{1to16},0x7b

// CHECK: vcmpps  k2 , zmm17, dword ptr [rdx - 516]{1to16}, 123
// CHECK:  encoding: [0x62,0xf1,0x74,0x50,0xc2,0x92,0xfc,0xfd,0xff,0xff,0x7b]
          vcmpps k2,zmm17,DWORD PTR [rdx-0x204]{1to16},0x7b













