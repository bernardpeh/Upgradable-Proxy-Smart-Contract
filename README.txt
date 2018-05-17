Simple illustration of upgradable smart contracts

1. Get storage address from Registry

```
Registry.deployed().then(ins=>{ins.storage_contract().then(res=>{console.log(res)})})
```

2. Get storage contract from Current Logic Contract

```
LogicOne.deployed().then(ins => { ins.s().then(res => {console.log(res)}) })
```

3. Get val from storage

```
Storage.at(storage_address).getVal()
```


4. Set Current Logic contract in Registry

```
Registry.deployed().then(ins => {ins.setLogicContract(LogicOne.address)})
```

5. Get current Logic contract from storage

```
Storage.at(storage_address).logic_contract();
```

6. SetVal from Current Logic Contract

```
LogicCurrent.deployed().then(ins => { ins.setVal(2); } )
```

7. getVal from Storage

```
Storage.at(storage_address).getVal()
```

8. setVal from Registry

```
LogicOne.at(Registry.address).setVal()
```