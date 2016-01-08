# Covers
- Plug (kinda)
- Plug.Router
- exrm
- Nginx
- EEx

# Prepare The Server
1. Debian Server
2. Elixir Installed (see erlang solutions repository)
```
wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb
sudo dpkg -i erlang-solutions_1.0_all.deb
sudo apt-get update
sudo apt-get install esl-erlang
sudo apt-get install elixir
```
3. User For Running App
```
sudo adduser duckex
```
4. Nginx
```
sudo apt-get install nginx
```
5. DNS
