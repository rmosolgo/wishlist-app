# Wishlist

## Todo

- [ ] Create a wishlist anonymously
- [ ] Wishlists have a master link for editing
- [ ] Wishlists have a share link
- [ ] Wishlists have a title
- [ ] Wishlists have text items
- [ ] Items can be checked anonymously; not reflected on master link


Routes:

- `GET /`
- `GET /lists/new`
- `GET /lists/:secret` Master link
- `POST /lists/:secret/items` Create item
- `DELETE /lists/:secret/items/:id` delete item
- `PATCH /lists/:secret/items/:id` edit item
- `GET /share/:id(/:title)?` Public link
- `POST /share/:list_id/items/:id/check` Check
- `DELETE /share/:list_id/items/:id/check` uncheck
## To don't

- [ ] Reorder list items
- [ ] Any kind of user model
