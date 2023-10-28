<div align="center">
<h1 align="center">
<img src="https://github.com/047pegasus/GitBit/blob/24268bb44de7187eaf1dee2a25df323e7b521279/logo.jpg" width="300" />
<br>GitBit</h1>
<h3>◦ An online monitoring 🎢 and tools 🪛 One Stop Shop for Github ✅</h3>
<h3>◦ Developed with MERN, Fastn and other cutting edge tools.</h3>

<p align="center">
<img src="https://img.shields.io/badge/React-61DAFB.svg?style&logo=React&logoColor=black" alt="React" />
<img src="https://img.shields.io/badge/Express-000000.svg?style&logo=Express&logoColor=white" alt="Express" />
<img src="https://img.shields.io/badge/MongoDB-47A248.svg?style&logo=MongoDB&logoColor=white" alt="MongoDB" />
<img src="https://img.shields.io/badge/Node.js-43853D?style&logo=node.js&logoColor=white" alt="NodeJS"/>
  
  <img src="https://img.shields.io/badge/Github-000000.svg?style&logo=Github&logoColor=white" alt="Github" />

<img src="https://img.shields.io/badge/HTML5-E34F26.svg?style&logo=HTML5&logoColor=white" alt="HTML5" />
<img src="https://img.shields.io/badge/JavaScript-F7DF1E.svg?style&logo=JavaScript&logoColor=black" alt="JavaScript" />
<img src="https://img.shields.io/badge/SVG-FFB13B.svg?style&logo=SVG&logoColor=black" alt="SVG" />
<img src="https://img.shields.io/badge/Axios-5A29E4.svg?style&logo=Axios&logoColor=white" alt="Axios" />
<img src="https://img.shields.io/badge/JSON-000000.svg?style&logo=JSON&logoColor=white" alt="JSON" />
  
</p>
<img src="https://img.shields.io/github/license/047pegasus/GitBit?style&color=5D6D7E" alt="GitHub license" />
<img src="https://img.shields.io/github/last-commit/047pegasus/GitBit?style&color=5D6D7E" alt="git-last-commit" />
<img src="https://img.shields.io/github/commit-activity/m/047pegasus/GitBit?style&color=5D6D7E" alt="GitHub commit activity" />
<img src="https://img.shields.io/github/languages/top/047pegasus/GitBit?style&color=5D6D7E" alt="GitHub top language" />
</div>
<br/>
<div align="center">
  <img src="https://socialify.git.ci/047pegasus/GitBit/image?description=1&font=Raleway&forks=1&language=1&name=1&owner=1&pattern=Floating%20Cogs&stargazers=1&theme=Dark" alt="GitBit" width="640" height="320" />
</div>

---

## 📖 Table of Contents
- [📖 Table of Contents](#-table-of-contents)
- [📍 Overview](#-overview)
- [📦 Features](#-features)
- [📃 Documentation](https://github.com/047pegasus/gitbit_docs)
- [📂 Repository Structure](#-repository-structure)
- [⚙️ Modules](#modules)
- [🚀 Getting Started](#-getting-started)
    - [🔧 Installation](#-installation)
    - [🤖 Running bookit](#-running-bookit)
    - [🧪 Tests](#-tests)
- [🛣 Roadmap](#-roadmap)
- [🤝 Contributing](#-contributing)
- [📄 License](#-license)
- [👏 Acknowledgments](#-acknowledgments)

---


## 📍 Overview
GitBit is an online one stop solution for every devloper who uses Github and especially helpful for all new developers in the stream and can help them a lot by being thier handy partner in terms of all tools in one place organized and daily add ons to the page, just like a library full of new and creatuve books to enhance user's productivity. 
<br>
<br>
The aim is to develop a compact yet effective web-app which delivers to the current need of community work  (eg. Community Leaderboard, Tools for registered users), along with individual user focused materials like User Dashboard and advanced statiscially detmined and visualized user development metrics.    

---

## 📦 Features
The possible features for the project are endless, but as an origin of a Hackathon we trusted the development process and were able to fully manage to deploy given features for the users by the end of this project submission deadline: <br>
<br>
1. Initial setupless- **One Click Dashboard** for a valid user profile. 
2. Support for Login using secure oAuth 2.0
3. Community Format support style (for all development members)
4. LeaderBoard to mark progress (for platform registered members only)  
5. Collection of Home Grown as well as community contributed tool projcts that can help your Github lifecycle a work of breeze and joy.

---

## 📂 Repository Structure

```sh
└── GitBit/
    ├── LICENSE
    ├── README.md
    ├── CONTRIBUTING.md
    └── src/
        ├── assets
        ├── Backend
        ├── Components
        ├── Store
    └── public/
    └── dist/

```

---

## ⚙️ Modules

<details closed><summary>Src</summary>

| File                                                                                               | Summary                   |
| ---                                                                                                | ---                       |
| [App.jsx](https://github.com/047pegasus/GitBit/blob/main/GitBit/src/App.js)                         | Contains all Routes to the pages using React-Router along with a private route that encapsulates all other feature routes for logged in users. |

</details>

<details closed><summary>Pages</summary>

| File                                                                                                         | Summary                   |
| ---                                                                                                          | ---                       |
| [Profile.page.js](https://github.com/047pegasus/bookit/blob/main/bookit/src/pages/Profile.page.js)           | Profile Page for logged in user. |
| [Login.page.js](https://github.com/047pegasus/bookit/blob/main/bookit/src/pages/Login.page.js)               | Login Page for user.|
| [UserListings.js](https://github.com/047pegasus/bookit/blob/main/bookit/src/pages/UserListings.js)           | Page where user can biew all his/her  made listings on the webstore. |
| [Listbook.css](https://github.com/047pegasus/bookit/blob/main/bookit/src/pages/Listbook.js)                  | Page where user can list a book by filling a simple form with details about the book. |
| [History.page.js](https://github.com/047pegasus/bookit/blob/main/bookit/src/pages/History.page.js)           | Page to atore all history and transactions made by user.  |
| [Home.page.js](https://github.com/047pegasus/bookit/blob/main/bookit/src/pages/Home.page.js)                 | Default landing page for logged in users.|
| [Cart.page.js](https://github.com/047pegasus/bookit/blob/main/bookit/src/pages/Cart.page.js)                 | Basic Cart functionality page.|
| [PrivateRoute.page.js](https://github.com/047pegasus/bookit/blob/main/bookit/src/pages/PrivateRoute.page.js) | Component housing logic to redirect and route to home page if user is logged in. |
| [Reset.page.js](https://github.com/047pegasus/bookit/blob/main/bookit/src/pages/Reset.page.js)               | Page meant to reset user forgotten password.|
| [Signup.page.js](https://github.com/047pegasus/bookit/blob/main/bookit/src/pages/Signup.page.js)             | SignUp page for user.|

</details>

---

## 🚀 Getting Started

***Dependencies***

Please ensure you have the following dependencies installed on your system:

`- ℹ️ NodeJS`

### 🔧 Installation

1. Clone the GitBit repository:
```sh
git clone https://github.com/047pegasus/GitBit
```

2. Change to the project directory (on `master` branch for Web and `android` brsnch for Android):
```sh
cd GitBit
```

3. Install the dependencies:
Web Install using node:
```sh
npm install
```

Android Install using Pub in Flutter :
```sh
flutter pub add
```

### 🤖 Running GitBit:
<b> <i> You are already in position to roll the application!! ✅🚀 </i> </b>

In a terminal open two sessions and run each command group in a separate session.

```sh
npm start
```

```sh
cd src/backend
node {APP}.js
```
***Note: Here {APP.js} refers to all the backend files to connect to each collection hosted on the database on Mongo Atlas.*** 
---

## 🛣 Roadmap

> - [ ] `ℹ️  Task 1: Fix Android Bug on Login/SignUp (problems due to oAuth 2.0 usage unavailability in Andorid both using Firebase or using Mongo Realm SDK)`
> - [ ] `ℹ️  Task 2: Improve user Onboarding process Page (Leaderboard slow response time due to use of REST APIs in place of GraphQl APIs)`
> - [ ] `ℹ️  Task 3: Implement Tool Management API base addition feature for listing a new tool on basis of a form, user can fill up to feature their tool ont he webapp database.`


---

## 🤝 Contributing

Contributions are always welcome! Please follow these steps:
1. Fork the project repository. This creates a copy of the project on your account that you can modify without affecting the original project.
2. Clone the forked repository to your local machine using a Git client like Git or GitHub Desktop.
3. Create a new branch with a descriptive name (e.g., `new-feature-branch` or `bugfix-issue-123`).
```sh
git checkout -b new-feature-branch
```
4. Make changes to the project's codebase.
5. Commit your changes to your local branch with a clear commit message that explains the changes you've made.
```sh
git commit -m 'Implemented new feature.'
```
6. Push your changes to your forked repository on GitHub using the following command
```sh
git push origin new-feature-branch
```
7. Create a new pull request to the original project repository. In the pull request, describe the changes you've made and why they're necessary.
The project maintainers will review your changes and provide feedback or merge them into the main branch.

---

## 📄 License

This project is licensed under the `ℹ️  LICENSE-TYPE` License. See the [LICENSE-Type](LICENSE) file for additional info.

---

## 👏 Acknowledgments
We also would like to thank all the third party tools that we list on our project to help all the users through our website. Without these tools our project would not have been possible and we would like to thank all of these amaziong tools avaialable online to help us, ultimately help the dev community. Although we support all these endeavours, some of the top tols that we readily make availble to ur users in this alpha release of the application include the following:

`https://github.com/Platane/snk`

`https://github.com/ShashwatPS/Forest_Farmer`

`https://github.com/047pegasus/Zephyr/blob/sps/Web/src/Pages/Gsoc.jsx`

`https://github.com/047pegasus/Zephyr/blob/sps/Web/src/Pages/Trending.jsx`

[↑ Return](#Top)

---
