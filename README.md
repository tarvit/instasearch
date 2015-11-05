# About
## This is a Rails Application which works with Instagram API
It allows User to use the following features:
* search users
* search tags
* display user info
* display tag info
* display most commented user items for last week
* display most liked user items for last week
* display most commented tag items for last week
* display most liked user items for last week

## Architecture
There are 2 central modules `InstagramDirectAPI` and `InstagramMediaTop` containing all core components. The components described below.
`InstagramDirectAPI`
  * `Client` - performs HTTP requests to instagram API, handles all needed API calls.
  * `LastWeekMedia`
    * `Base` - contains all logics for last week media querying. Has abstract method `fetch_media_items`.
    * `ForUser` - implements specific API call to collect user`s media
    * `ForTag` - implements specific API call to collect tag`s media

`InstagramMediaTop`
  * `Base` - calculates list of the most popular items. Uses bastract non implemented method `score`. Receives @media_items parameter - the abstraction compatible with @tag_media_items and @user_media_item terms.
  * `LikesTop` - implements `score` method so algorithm uses likes count as a score rule.
  * `CommentsTop` - implements `score` method so algorithm uses comments count as a score rule.


