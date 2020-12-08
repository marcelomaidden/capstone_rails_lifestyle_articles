# Rails Capstone - Lifestyle articles

This project was presented as final project for the Rails Curriculum. It is a Lifestyle Article where people can apply filters by category and vote on their preferred articles.
People can create their own articles and they have a page that suggests articles based on their votes.

## Built With

- Ruby v2.7.0
- Ruby on Rails v5.2.4

## Video presentantions

[Video 1](https://www.loom.com/share/5b228ca5e4384477b71c59ffddf3c9a8)
[Continuation](https://www.loom.com/share/76563ba50ba74552bc75d087fbc2380b)

## Live Demo

[Lifestyle articles](https://shrouded-crag-57574.herokuapp.com/)


## Getting Started

To get a local copy up and running follow these simple example steps.

## Clone the repository

```
   git clone https://github.com/marcelomaidden/capstone_rails_lifestyle_articles.git
   cd capstone_rails_lifestyle_articles
```

### Prerequisites

Ruby: 2.6.3
Rails: 5.2.3
Postgres: >=9.5

### Setup

Instal gems with:

```
   bundle install
```

Setup database with:

```
   rails db:create
   rails db:migrate
   rails db:seed
```

### Usage

Start server with:

```
    rails server
```

Open `http://localhost:3000/` in your browser.

### Run tests

```
    rpsec --format documentation
```


### Deployment

In order to deploy this app to Heroku follow the steps below

Install the Heroku CLI available [here](https://devcenter.heroku.com/articles/heroku-cli)

After that type the command to create the app and add the heroku repository to your project

```
    heroku create
```

Then deploy the app.

```
    git push -u heroku {you-branch}:master
```
    
Change {your-branch} for the name of your local branch

Follow the instructions on your terminal to get the URL where your app was deployed


Finally run the command to create your database and tables on Heroku's server

```
    heroku run rails db:migrate
    heroku run rails db:seed
``` 

👤 **Marcelo Fernandes**

- GitHub: [@marcelomaidden](https://github.com/marcelomaidden)
- Twitter: [@marcelomaidden](https://twitter.com/marcelomaidden)
- LinkedIn: [Marcelo Fernandes](https://linkedin.com/in/marcelofernandesdearaujo)

## Acknowledments
- Nelson Sakwa
- All websites where I found images and text for the articles
- Font Awesome
- W3schools
- Twitter Boostrap

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](https://github.com/marcelomaidden/capstone_rails_lifestyle_articles/issues/).

## Show your support

Give a ⭐️ if you like this project!
