# Rento Petto
<p align="left">A humorous pet rental app similar in nature to Airbnb, designed to allow pet owners to receive bookings from renters which can be accepted or denied. The renters can also leave reviews of pets, each pet having an average star rating of reviews. Users can put up new pets for rental including a picture, description, and details.</p>

![Rento bookings](https://user-images.githubusercontent.com/59186645/158573544-b7154218-2bb2-49e0-84f7-9cacd9e1d93f.png)
![King Boo](https://user-images.githubusercontent.com/59186645/158573395-496325ab-a06e-466b-8cd1-07cc6745b82e.png)



## Installing locally :computer:
### Setup
##### Install gems
```
bundle install
```
##### Install JS packages
```
yarn install
```

### ENV variables
##### Create `.env`
```
touch .env
```
##### Inside `.env`, set these variables
```
CLOUDINARY_URL=cloudinary://your_key
```

### DB Setup
```
rails db:create
rails db:migrate
rails db:seed
```

### Run your server

```
rails s
```


## Our Team
* [Andrei Mori](https://github.com/andreicodenz)
* [Risako Nagai](https://github.com/Risako03)
* [Taylor Mravic](https://github.com/tmravic)
