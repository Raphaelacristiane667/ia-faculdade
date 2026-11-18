# Cenário 6: Switch L3 (3650-24PS), passo a passo

## 1. Equipamentos e cabos
| Ligação | Portas sugeridas | Cabo (igual à figura) |
|---|---|---|
| PC1, PC0 ↔ Switch1 (2950-24) | Fa0 ↔ Fa0/1 e Fa0/2 | Straight-Through (linha cheia) |
| Switch1 ↔ Router1 (2911) | Fa0/3 ↔ Gi0/0 | Straight-Through |
| Router1 ↔ Multilayer Switch0 (3650-24PS) | Gi0/1 ↔ Gi1/0/1 | Cross-Over (tracejado) |
| Multilayer Switch0 ↔ Router2 (2911) | Gi1/0/2 ↔ Gi0/0 | Cross-Over (tracejado) |
| Router2 ↔ PC99 | Gi0/1 ↔ Fa0 | Cross-Over (tracejado) |
| Router2 ↔ Cloud0 | Gi0/2 ↔ Ethernet6 | Straight-Through (só ilustrativo) |

Passe o mouse sobre os triângulos para conferir o nome de cada porta. Se no seu cenário as portas forem outras, troque o nome nos comandos abaixo.

**3650:** antes de tudo, abra a aba **Physical** e arraste a fonte **AC Power Supply** para os 2 slots de alimentação. Sem isso a switch não liga.

## 2. PCs (Desktop > IP Configuration > Static)
| PC | IP | Máscara | Gateway |
|---|---|---|---|
| PC1 | 192.168.0.202 | 255.255.255.0 | 192.168.0.7 |
| PC0 | 192.168.0.201 | 255.255.255.0 | 192.168.0.7 |
| PC99 | 192.168.10.10 | 255.255.255.0 | 192.168.10.1 |

## 3. Router1
```
enable
configure terminal
hostname Router1
interface GigabitEthernet0/0
 ip address 192.168.0.7 255.255.255.0
 no shutdown
 exit
interface GigabitEthernet0/1
 ip address 172.21.0.7 255.255.0.0
 no shutdown
 exit
ip route 0.0.0.0 0.0.0.0 172.21.0.1
end
write
```
Tudo o que não é rede local do Router1 sai pela switch L3 (rota padrão).

## 4. Multilayer Switch0 (3650-24PS), comandos do professor
Ao aparecer "initial configuration dialog", responda `no`.
```
enable
configure terminal
hostname MLS0
interface GigabitEthernet1/0/1
 no shutdown
 no switchport
 ip address 172.21.0.1 255.255.0.0
 exit
interface GigabitEthernet1/0/2
 no shutdown
 no switchport
 ip address 10.0.0.1 255.0.0.0
 exit
ip routing
ip route 192.168.0.0 255.255.255.0 172.21.0.7
ip route 0.0.0.0 0.0.0.0 10.0.0.2
end
write
```
- `no switchport` transforma a porta em porta roteada, que aceita IP.
- `ip routing` liga o roteamento na switch L3.

## 5. Router2
```
enable
configure terminal
hostname Router2
interface GigabitEthernet0/0
 ip address 10.0.0.2 255.0.0.0
 no shutdown
 exit
interface GigabitEthernet0/1
 ip address 192.168.10.1 255.255.255.0
 no shutdown
 exit
ip route 192.168.0.0 255.255.255.0 10.0.0.1
ip route 172.21.0.0 255.255.0.0 10.0.0.1
end
write
```
O Router2 precisa saber voltar para a rede corporativa (192.168.0.0) e para o enlace 172.21.0.0. Sem essas rotas, o ping chega no PC99 mas a resposta não volta.

## 6. Testes (Command Prompt do PC1)
```
ipconfig
ping 192.168.0.7
ping 172.21.0.1
ping 10.0.0.2
ping 192.168.10.10
tracert 192.168.10.10
```
O `tracert` deve mostrar 192.168.0.7 → 172.21.0.1 → 10.0.0.2 → 192.168.10.10. No roteador e na switch L3, use `show ip route` e `show ip interface brief` para conferir.

O primeiro ping pode falhar enquanto o ARP é resolvido. Repita.
