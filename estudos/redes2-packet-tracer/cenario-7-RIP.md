# Cenário 7: protocolo RIP com 3 roteadores

## 1. Equipamentos
- 3 × Router-PT: **Router1**, **Router2** e **Router3**
- Switch 4 (2950-24), Switch 2 (2950T-24) e Switch 3 (2950T-24)
- Laptop2 (Laptop-PT), PC0 (PC-PT) e Server0 (Server-PT)

## 2. Cabos
Ao ligar cada cabo, **escolha a porta no menu**. Não use o modo automático, para que as portas fiquem iguais aos comandos abaixo.

| Origem | Destino | Cabo |
|---|---|---|
| Laptop2 Fa0 | Switch 4 Fa0/1 | Straight-Through |
| Switch 4 Fa0/2 | Router1 Fa0/0 | Straight-Through |
| Router1 Se2/0 | Router2 Se2/0 | **Serial DCE** (clique primeiro no Router1) |
| Router1 Se3/0 | Router3 Se2/0 | **Serial DCE** (clique primeiro no Router1) |
| Router2 Fa0/0 | Switch 2 Fa0/1 | Straight-Through |
| PC0 Fa0 | Switch 2 Fa0/2 | Straight-Through |
| Router3 Fa1/0 | Switch 2 Fa0/3 | Straight-Through |
| Router3 Fa0/0 | Switch 3 Fa0/1 | Straight-Through |
| Server0 Fa0 | Switch 3 Fa0/2 | Straight-Through |

## 3. Hosts (Desktop > IP Configuration > Static)
| Host | IP | Máscara | Gateway |
|---|---|---|---|
| Laptop2 | 172.18.50.50 | 255.255.0.0 | 172.18.50.254 |
| PC0 | 192.168.0.100 | 255.255.255.0 | 192.168.0.1 |
| Server0 | 172.16.10.10 | 255.255.0.0 | 172.16.10.1 |

## 4. Router1
```
enable
configure terminal
hostname Router1
interface FastEthernet0/0
 ip address 172.18.50.254 255.255.0.0
 no shutdown
 exit
interface Serial2/0
 ip address 10.0.0.1 255.0.0.0
 clock rate 64000
 no shutdown
 exit
interface Serial3/0
 ip address 20.0.0.1 255.0.0.0
 clock rate 64000
 no shutdown
 exit
router rip
 network 172.18.0.0
 network 10.0.0.0
 network 20.0.0.0
end
write
```

## 5. Router2
```
enable
configure terminal
hostname Router2
interface Serial2/0
 ip address 10.0.0.2 255.0.0.0
 no shutdown
 exit
interface FastEthernet0/0
 ip address 192.168.0.1 255.255.255.0
 no shutdown
 exit
router rip
 network 10.0.0.0
 network 192.168.0.0
end
write
```

## 6. Router3 (igual ao exemplo do roteiro)
```
enable
configure terminal
hostname Router3
interface FastEthernet0/0
 ip address 172.16.10.1 255.255.0.0
 no shutdown
 exit
interface FastEthernet1/0
 ip address 192.168.0.200 255.255.255.0
 no shutdown
 exit
interface Serial2/0
 ip address 20.0.0.2 255.0.0.0
 no shutdown
 exit
router rip
 network 192.168.0.0
 network 172.16.0.0
 network 20.0.0.0
end
write
```
Se algum `clock rate` der erro no Router1, a ponta DCE daquele cabo ficou no outro roteador. Aplique o comando na serial do outro lado.

Espere uns 30 segundos e rode `show ip route` em cada roteador. As rotas aprendidas aparecem com a letra **R**, e as 5 redes devem estar na tabela.

## 7. Testes do roteiro
1. Na Simulação, em **Edit Filters > IPv4**, deixe marcados só **RIP** e **ICMP**.
2. No Server0: `ping -n 30 172.18.50.50`
3. No Laptop2: `ping -n 30 172.16.10.10`
4. Depois: `tracert 172.16.10.10` (Laptop2) e `tracert 192.168.0.100`, com a Simulação ligada, para tirar o print das rotas.
5. Para os prints, rode `ipconfig` nos hosts e `show ip route` nos roteadores.

---

## Variante "Integralização" (AVA): rotas estáticas, SEM RIP
Faça numa cópia do arquivo. Primeiro, em cada roteador, rode `configure terminal` e depois `no router rip`. Em seguida cole as rotas abaixo: **4 no Router1, 6 no Router2 e 4 no Router3**. Cada rede remota fica com dois caminhos.

**Router1**
```
ip route 192.168.0.0 255.255.255.0 10.0.0.2
ip route 192.168.0.0 255.255.255.0 20.0.0.2
ip route 172.16.0.0 255.255.0.0 20.0.0.2
ip route 172.16.0.0 255.255.0.0 10.0.0.2
```
**Router2**
```
ip route 172.18.0.0 255.255.0.0 10.0.0.1
ip route 172.18.0.0 255.255.0.0 192.168.0.200
ip route 20.0.0.0 255.0.0.0 10.0.0.1
ip route 20.0.0.0 255.0.0.0 192.168.0.200
ip route 172.16.0.0 255.255.0.0 192.168.0.200
ip route 172.16.0.0 255.255.0.0 10.0.0.1
```
**Router3**
```
ip route 172.18.0.0 255.255.0.0 20.0.0.1
ip route 172.18.0.0 255.255.0.0 192.168.0.1
ip route 10.0.0.0 255.0.0.0 20.0.0.1
ip route 10.0.0.0 255.0.0.0 192.168.0.1
```
Depois rode `end`, `write` e `show ip route`. As rotas estáticas aparecem com a letra **S**.
