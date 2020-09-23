# Answer factories
## `IValidationFactory`
### `abstract public validate(formData):string`
reutrn state of answer valid|invalid|pedding...

## `Default factory` : `IValidationFactory`
### `validate(formData):bool`
evaluje odpoveď zapísanu pomocou pseudo codu zkompilovaného do `IAnswerStatement`.

# Answer statements
## `IAnswerStatement`
### `abstract public __invoke(formData):bool`
rozhranie pre všetky zavolatelné triedy pomocou default factory prip. aj pre ich kombinaciu

## `FormStatement`:`IAnswerStatement`
- spoločné pre všetky statementy ktoré porovávaju inputy
- napr. vytahovanie hodnôt a pod.
## `String` : `FormStatement`
Porovná či daná odpoveď je string a či sa zhoduje s placeholderom

### `constructor(correctValue:string,inputIndex:int=0,opt:any)`
optional: - case/omit case...

### `__invoke(formData):bool` - test hodnoty
## `Real` : `FormStatement`
constructor(correctValue:double,[dMin:double,dMax:double],inputIndex:int=0 )
## `Int` : `FormStatement`
constructor(correctValue:int,inputIndex:int=0)

## `LogicStatement`:`IAnswerStatement`
## `And` : `IAnswerStatement`
constructor(...args:IAnswerStatement[])
## `Or` : `IAnswerStatement`
constructor(...args:IAnswerStatement[])
## `Not` : `IAnswerStatement`
constructor(arg:IAnswerStatement)
...
