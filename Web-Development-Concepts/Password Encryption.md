# Password Hashing
Plain text storage in database for passwords is **insecure**. Passwords are hashed before being stored:
```Ruby
Digest::SHA2.hexdigest("hello") => "2cf24dba5fb0a30e26e83b2ac5b9e29e1b161e5c1fa7425e73043362938b9824"
```
Full Solution is to **Salt** first, then hash passwords. A salt is some random data that is another argument passed to the hashing function.
