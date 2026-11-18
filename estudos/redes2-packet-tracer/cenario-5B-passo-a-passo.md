# Cenário 5B: DNS, Web, DHCP e rotas estáticas (passo a passo)

## 1. Equipamentos (use os modelos genéricos)
O tutorial diz "2911/2960" na Etapa 1, mas os nomes de porta (Fa4/0, Fa4/1, Fa6/1) são do **Router-PT** e do **Switch-PT**. Use estes:

- 2 × Router-PT: **R1** e **R2**
- 2 × Switch-PT: **SW-ESQ** e **SW-DIR**
- 4 × Server-PT: **WEB**, **DNS**, **DHCP-ESQ** e **DHCP-DIR**
- 3 × PC-PT: **PC1**, **PC2** e **PC3**
- 1 × Laptop-PT: **LAPTOP**

## 2. Cabos
| De | Para | Cabo |
|---|---|---|
| R1 Fa0/0 | WEB Fa0 | Automático (raio) |
| R1 Fa1/0 | DNS Fa0 | Automático (raio) |
| R1 Fa4/0 | SW-ESQ Fa4/1 | Copper Straight-Through |
| DHCP-ESQ Fa0 | SW-ESQ Fa6/1 | Copper Straight-Through |
| PC1 Fa0 | SW-ESQ Fa3/1 | Copper Straight-Through |
| R2 Fa0/0 | SW-DIR Fa0/1 | Copper Straight-Through |
| DHCP-DIR Fa0 | SW-DIR Fa6/1 | Copper Straight-Through |
| PC2 / PC3 / LAPTOP | SW-DIR Fa1/1 / Fa2/1 / Fa3/1 | Copper Straight-Through |
| R1 Se2/0 | R2 Se2/0 | **Serial DCE**, clicando primeiro no R1 |

## 3. R1 (aba CLI; se aparecer o diálogo inicial, responda `no`)
```
enable
configure terminal
hostname R1
no ip domain-lookup
interface Fa0/0
 description REDE_WEB
 ip address 172.16.1.1 255.255.0.0
 no shutdown
 exit
interface Fa1/0
 description REDE_DNS
 ip address 172.17.1.1 255.255.0.0
 no shutdown
 exit
interface Fa4/0
 description LAN_ESQUERDA
 ip address 192.168.5.1 255.255.255.0
 no shutdown
 exit
interface Serial2/0
 description ENLACE_R1_R2
 ip address 10.0.0.1 255.255.255.252
 clock rate 64000
 no shutdown
 exit
ip route 172.19.0.0 255.255.0.0 10.0.0.2
end
copy running-config startup-config
```
Se o `clock rate` der erro, a ponta DCE ficou no R2. Nesse caso tire o comando do R1 (`no clock rate`) e coloque-o na Serial2/0 do R2.

## 4. R2
```
enable
configure terminal
hostname R2
no ip domain-lookup
interface Fa0/0
 description LAN_DIREITA
 ip address 172.19.1.1 255.255.0.0
 no shutdown
 exit
interface Serial2/0
 description ENLACE_R2_R1
 ip address 10.0.0.2 255.255.255.252
 no shutdown
 exit
ip route 172.16.0.0 255.255.0.0 10.0.0.1
ip route 172.17.0.0 255.255.0.0 10.0.0.1
ip route 192.168.5.0 255.255.255.0 10.0.0.1
end
copy running-config startup-config
```
Para verificar: `show ip interface brief` (as interfaces usadas devem estar up/up), `show ip route` e `ping 10.0.0.1`.

## 5. Servidores (Desktop > IP Configuration > Static)
| Servidor | IPv4 | Máscara | Gateway | DNS |
|---|---|---|---|---|
| WEB | 172.16.3.3 | 255.255.0.0 | 172.16.1.1 | 172.17.50.50 |
| DNS | 172.17.50.50 | 255.255.0.0 | 172.17.1.1 | 172.17.50.50 |
| DHCP-ESQ | 192.168.5.10 | 255.255.255.0 | 192.168.5.1 | 172.17.50.50 |
| DHCP-DIR | 172.19.10.100 | 255.255.0.0 | 172.19.1.1 | 172.17.50.50 |

## 6. DHCP (Services > DHCP > On, preencha o pool e clique em Add ou Save)
| Campo | DHCP-ESQ | DHCP-DIR |
|---|---|---|
| Pool Name | LAN_ESQUERDA | LAN_DIREITA |
| Default Gateway | 192.168.5.1 | 172.19.1.1 |
| DNS Server | 172.17.50.50 | 172.17.50.50 |
| Start IP | 192.168.5.100 | 172.19.200.200 |
| Subnet Mask | 255.255.255.0 | 255.255.0.0 |
| Max Users | 10 | 50 |

Dica: dá para editar o próprio `serverPool` com esses valores e clicar em **Save**.

## 7. DNS e WEB
- **DNS** > Services > DNS > **On**. Adicione os registros com Type **A Record**:
  - Name `meusite.org.br`, Address `172.16.3.3`, depois **Add**
  - (opcional) Name `www.cenario5b.test`, Address `172.16.3.3`, depois **Add**. O tutorial usa este nome nos testes finais, então com os dois registros cadastrados os dois testes funcionam.
- **WEB** > Services > HTTP: deixe **On**. Se quiser, edite o `index.html`:
```
<html>
<head><title>Cenário 5B</title></head>
<body>
 <h1>Servidor WEB do Cenário 5B</h1>
 <p>DNS, HTTP, DHCP e roteamento funcionando.</p>
</body>
</html>
```

## 8. Clientes e testes
1. Em PC1, PC2, PC3 e LAPTOP, vá em Desktop > IP Configuration e marque **DHCP**. Depois rode `ipconfig /all`.
   - PC1 deve receber um IP entre 192.168.5.100 e .109, com gateway 192.168.5.1.
   - PC2, PC3 e LAPTOP devem receber um IP entre 172.19.200.200 e .249, com gateway 172.19.1.1.
2. Rode os testes no Command Prompt, nesta ordem:
```
ping 192.168.5.1        (PC1, o gateway local)
ping 10.0.0.2
ping 172.17.50.50
ping 172.16.3.3
ping meusite.org.br
```
3. Abra Desktop > Web Browser e acesse `http://meusite.org.br`. Faça isso em um cliente de cada LAN.

O primeiro ping pode falhar por causa do ARP. Repita antes de concluir que há erro.

## Prints para entregar
- `show ip interface brief` e `show ip route` no R1 e no R2
- `ipconfig /all` de um PC de cada LAN
- Ping pelo nome
- Navegador abrindo a página
