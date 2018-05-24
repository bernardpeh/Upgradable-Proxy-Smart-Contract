Simple illustration of upgradable smart contracts

1. Set Current Logic contract in Registry

```
Registry.at(Registry.address).setLogicContract(LogicOne.address)
```

2. Check logic_contract address in Registry

```
Registry.at(Registry.address).logic_contract()
```

3. Update Registry storage from LogicOne

```
LogicOne.at(Registry.address).setVal(2)
// Check value: value should be 4
LogicOne.at(Registry.address).val()
// check owner val
Registry.at(Registry.address).owner()
```

5. Change logic layer to LogicTwo

```
Registry.at(Registry.address).setLogicContract(LogicTwo.address)
```

6. Set LogicTwo new value
```
LogicTwo.at(Registry.address).setVal(2)
// check value: value should be 6
LogicTwo.at(Registry.address).val()
```

7. LogicOne should still be able to set the val

```
LogicOne.at(Registry.address).setVal(2)
// check value: value should be 6. WHY?
LogicOne.at(Registry.address).val()
```