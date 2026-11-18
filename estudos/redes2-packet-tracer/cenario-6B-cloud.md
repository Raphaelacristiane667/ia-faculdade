# Cenário 6-B-Cloud: WAN Frame Relay e "Internet simulada"

Faça este cenário numa **cópia** do Cenário 6 (Salvar como, `Cenario-6B.pkt`).

## 0. Ajustes no Cenário 6 antes de começar (importante)
A figura do 6-B usa algumas coisas diferentes do Cenário 6:
- O enlace entre a switch L3 e o Router_2 passa a ser **30.0.0.0/30**, e não mais 10.0.0.0/8. O motivo é que a rede 10.0.0.0/8 "engoliria" as redes 10.10.201.0/24 e 10.1.1.0/30 do provedor, e as rotas ficariam erradas.
- O PC da rede corporativa aparece como PC0 **192.168.0.50/24** (gateway 192.168.0.7). O seu PC0 e o seu PC1 continuam funcionando com os IPs que já têm.
- O PC99 aparece como **PC-DATACENTER**. O IP continua 192.168.10.10.

**Multilayer Switch (3650):**
```
enable
configure terminal
interface GigabitEthernet1/0/2
 ip address 30.0.0.1 255.255.255.252
 exit
no ip route 0.0.0.0 0.0.0.0 10.0.0.2
ip route 0.0.0.0 0.0.0.0 30.0.0.2
end
write
```
**Router_2** (enlace com a switch L3):
```
enable
configure terminal
interface GigabitEthernet0/0
 ip address 30.0.0.2 255.255.255.252
 exit
no ip route 192.168.0.0 255.255.255.0 10.0.0.1
no ip route 172.21.0.0 255.255.0.0 10.0.0.1
ip route 192.168.0.0 255.255.255.0 30.0.0.1
ip route 172.21.0.0 255.255.0.0 30.0.0.1
end
write
```
O Router_1 não muda, porque a rota padrão dele já aponta para 172.21.0.1.

## 1. Módulos seriais (aba Physical: desligue, encaixe o módulo, ligue de novo)
- **Router_2 (2911):** HWIC-2T no slot que gera **Serial0/3/0**, como na figura do tutorial
- **Router_3 (2911):** HWIC-2T, para ter **S0/3/0** e **S0/3/1**
- **Router_4 (2811):** HWIC-2T (ou WIC-2T), para ter **S0/3/0**
- A Cloud-PT já vem com as portas Serial0 a Serial3

## 2. Equipamentos novos e cabos
Adicione Router_3 (2911, Display Name **Router_3-ISP**), Router_4 (2811), Switch2 (2950T-24), Server0 e Cloud0 (Cloud-PT).

| Origem | Destino | Cabo |
|---|---|---|
| Router_2 S0/3/0 | Cloud0 Serial3 | Serial DTE |
| Cloud0 Serial0 | Router_3-ISP S0/3/0 | Serial DTE (a Cloud é DCE) |
| Router_3-ISP S0/3/1 | Router_4 S0/3/0 | Serial DCE (clique primeiro no Router_3) |
| Router_4 Fa0/0 | Switch2 Gi0/1 | Copper Straight-Through |
| Switch2 Fa0/1 | Server0 Fa0 | Copper Straight-Through |

## 3. Cloud0 (aba Config)
1. **Serial3**: em DLCI digite `201`, em Name digite `R2`, depois **Add**. Deixe LMI em Cisco.
2. **Serial0**: em DLCI digite `201`, em Name digite `R3`, depois **Add**.
3. **Connections > Frame Relay**: escolha `Serial3 / R2` de um lado e `Serial0 / R3` do outro, depois **Add**.

Sem o passo 3 o circuito (PVC) não existe e nada funciona.

## 4. Router_3-ISP
```
enable
configure terminal
hostname Router_3-ISP
no ip domain-lookup
interface Serial0/3/0
 no ip address
 encapsulation frame-relay
 no shutdown
 exit
interface Serial0/3/0.201 point-to-point
 ip address 10.10.201.1 255.255.255.0
 frame-relay interface-dlci 201
 exit
interface Serial0/3/1
 ip address 10.1.1.1 255.255.255.252
 clock rate 2000000
 no shutdown
 exit
ip route 192.168.40.0 255.255.255.0 10.1.1.2
ip route 192.168.10.0 255.255.255.0 10.10.201.2
ip route 30.0.0.0 255.255.255.252 10.10.201.2
ip route 172.21.0.0 255.255.0.0 10.10.201.2
ip route 192.168.0.0 255.255.255.0 10.10.201.2
end
copy running-config startup-config
```
Se o `clock rate` der erro, a ponta DCE ficou no Router_4. Tire o comando daqui e aplique na S0/3/0 do Router_4. Para conferir qual ponta é a DCE, use `show controllers serial 0/3/1`.

## 5. Router_2 (complemento, mantendo o que já existe)
```
enable
configure terminal
interface Serial0/3/0
 no ip address
 encapsulation frame-relay
 no shutdown
 exit
interface Serial0/3/0.201 point-to-point
 ip address 10.10.201.2 255.255.255.0
 frame-relay interface-dlci 201
 exit
ip route 10.1.1.0 255.255.255.252 10.10.201.1
ip route 192.168.40.0 255.255.255.0 10.10.201.1
end
copy running-config startup-config
```

## 6. Router_4
```
enable
configure terminal
hostname Router_4
no ip domain-lookup
interface Serial0/3/0
 ip address 10.1.1.2 255.255.255.252
 no shutdown
 exit
interface FastEthernet0/0
 ip address 192.168.40.1 255.255.255.0
 no shutdown
 exit
ip route 0.0.0.0 0.0.0.0 10.1.1.1
end
copy running-config startup-config
```

## 7. Switch2 (opcional, só para gerência)
```
enable
configure terminal
hostname Switch2
interface Vlan1
 ip address 192.168.40.2 255.255.255.0
 no shutdown
 exit
ip default-gateway 192.168.40.1
end
write
```

## 8. Server0
Desktop > IP Configuration > Static: **192.168.40.10 / 255.255.255.0**, gateway **192.168.40.1**. Em Services > HTTP, deixe **On**.

## 9. Testes (sempre do trecho mais perto para o mais longe)
| # | Onde | Comando |
|---|---|---|
| 1 | Router_3-ISP | `ping 10.10.201.2` |
| 2 | Router_3-ISP | `ping 10.1.1.2` |
| 3 | Router_4 | `ping 192.168.40.10` |
| 4 | Router_2 | `ping 192.168.40.10` |
| 5 | Server0 | `ping 10.10.201.2` |
| 6 | PC0 | `ping 192.168.40.10` e `tracert 192.168.40.10` |
| 7 | PC0 | Web Browser: `http://192.168.40.10` |

Comandos úteis: `show ip interface brief`, `show ip route`, `show frame-relay pvc` e `show frame-relay map`.

Se o PVC aparecer como INACTIVE ou DELETED, confira os DLCIs nas duas portas da Cloud e a linha em Connections > Frame Relay.
