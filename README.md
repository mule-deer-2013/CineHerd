#CineHerd
team: Dan, Lloyd, Luisa, Chae

Our [trello board](https://trello.com/b/1ObtqHqL/stackexchange) is hosted at: https://trello.com/b/1ObtqHqL/stackexchange

Please take a second to look over all of our cards and comments—

We'd like to add response functionality for our posts. There's a small catch—our schema is such that responses and posts are designed to be the same object. The main post for any given thread should have a parent_id and a root_id attribute that are set to nil. 

Any direct responses to that post (say, the post with post_id of 1) should have a root_id and parent_id set to reference that post (1). (Let's assume our response has a post_id of 2)

Any comments to THAT response should have a parent_id set to reference the response's post_id (2) and a root_id set to the post_id of the root post (1).

POST 1 (ROOT)
post_id: 1
root_id: nil
parent_id: nil

POST 2 (DIRECT RESPONSE)
post_id: 2
root_id: 1
parent_id: 1

POST 3 (COMMENT TO DIRECT RESPONSE)
post_id: 3
root_id: 1
parent_id: 2

User signup page exists, but it isn't currently linked to from the root or navbar. Navigate directly there with:

localhost:3000/users/new

