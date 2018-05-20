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
LogicOne.at(Registry.address).setVal2(2)
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
LogicTwo.at(Registry.address).setNewVal(2)
// check value: value should be 6
LogicTwo.at(Registry.address).val()
```

7. LogicOne should still be able to set the val

```
LogicOne.at(Registry.address).setVal(1)
// check value: value should be 2
LogicOne.at(Registry.address).val()
```

8. Get all Registry logs

```
var events = Registry.at(Registry.address).allEvents({fromBlock: 0, toBlock: 'latest', event: 'OwnerCalled'});
events.get(function(error, logs){ console.log(logs) });
```