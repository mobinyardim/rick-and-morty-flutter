# rick_and_morty_flutter

run this before building app:
```
flutter pub global activate build_runner
flutter pub run build_runner build
```


## Tech Stack

1.[Go Router](https://pub.dev/packages/go_router) used for navigation

2.[go_router_builder](https://pub.dev/documentation/go_router/latest/topics/Type-safe%20routes-topic.html) used for type safe navigations

3.[flutter bloc](https://bloclibrary.dev/#/) used as state management library


## Architecture

```mermaid

flowchart
	336735["CharacterRepository"] --> 981400["CharacterBloc"]
	linkStyle 0 stroke:#b1b1b6
	837416["CharacterRemoteSource"] <-->|"Implementation"| 344835("CharacterRemoteSourceImpl")
	linkStyle 1 stroke:#b1b1b6
	336735 <-->|"Implementation"| 250650("CharacterRepositoryImpl")
	linkStyle 2 stroke:#b1b1b6
	981400 --> 934843["CharactersPage"]
	linkStyle 3 stroke:#b1b1b6
	981400 --> 501356["HomePage"]
	linkStyle 4 stroke:#b1b1b6
	837416 -->|"Convert DTO to domain model"| 336735
	linkStyle 5 stroke:#b1b1b6
	subgraph 275660["Main Page<div><br></div>"]
		501356
		934843
		255881["LocationsPage"]
		311150["EpisodesPAge"]
	end
```


### Todo:

1.I manually parse json to dart classes just for playing with dart in future i will use [Json serializable](https://pub.dev/packages/json_serializable)
2.Add search bar for search between characters
3.Create view for episodes
4.Create view for locations
