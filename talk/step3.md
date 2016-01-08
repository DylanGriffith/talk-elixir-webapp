1. Clone the repo on the machine:
```
$ git clone git@github.com:DylanGriffith/talk-elixir-webapp.git
```

2. Build the release
```
$ MIX_ENV=prod mix deps.get && MIX_ENV=prod mix release
```

3. Run it:
```
$ rel/duckex/bin/duckex start
```

4. Test it:
```
$ curl http://localhost:5151
```
