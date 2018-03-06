# manyo_todo_app

## Overview
- todoアプリです。
- 基本機能
  - User機能  
    ログイン  
    プロフィール画像登録  
    レベルアップ(こなしたタスクに応じてexpがたまり、それに応じてレベルが上がる)  
  - List機能  
    taskのジャンル分け  
    list内のtaskを複数のユーザーで共有  
  - Task機能  
    taskの投稿、編集、削除  
    期限の設定  
    経験値  

## tableschema

### User
| name | type |
|---|---|
| name       | str |
| email      | str |
| login_id   | str |
| password   | str |
| img        | str |
| Lv         | int |
| exp        | int |

### List
| name | type |
|---|---|
| name    | str |
| user_id | int |

### Task
| name | type |
|---|---|
| list_id              | int      |
| user_id              | int      |
| should_do_user_id    | int      |
| content              | str      |
| limit                | datetime |
| memo                 | str      |
| complete             | str      |
| exp                  | int      |
| difficulty           | str      |
