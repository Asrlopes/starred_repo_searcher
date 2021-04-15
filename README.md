<h1 align="center">Starred Repos Searcher </h1>

<p align="center">
<img alt="elixir_logo" src="https://logosmarcas.net/wp-content/uploads/2020/12/GitHub-Logo.png" width="200"/>
</p>

<h2 align="center">
 Technical test Backend | Brainn
</h2>

<p align="center">
  <a href="https://www.linkedin.com/in/amor%C3%A9sio-de-souza-429ba314b/">
    <img alt="Made by" src="https://img.shields.io/badge/Feito%20por-Amor%C3%A9sio%20de%20Souza-purple">
  </a>
</p>

<p align="center">
  <a href="#introduction">Introduction</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#getting-started">Getting started</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#how-to-test">How to test</a>&nbsp;&nbsp;
</p>

## Introduction

I've challenged myself to make this programming exercise with an language that i'm a beginner, so this is written with Elixir/Phoenix.

## Getting started

First of all you need to clone this repository.

then ou can open the project and search the file inside `config/dev.exs`, here you can set up your database connection.

Here i'm using postgres as database, you need to have postgres in your machine or just use an docker image. Now you can follow the nexts steps.

- Install dependencies with `mix deps.get`
- Create and migrate your database with `mix ecto.setup`

- Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## How to test

Inside the root folder of the project you can see a file named `ìnsomnia-guide.json`, you can use him to see the endpointds avaibles for the api.

In your bash you can use this command `mix test`to see if the tests are up and running properly, i also added the capability to see the coverage of our tests.
You can use this command `mix coveralls`to see in your bash or if you want something more visual you can use `mix coveralls.html`, this command generate an html file inside the `cover` folder, then open this file in your browser.
