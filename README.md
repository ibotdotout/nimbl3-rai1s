#[Nimbl3-rai1s](http://nimbl3-rai1s.herokuapp.com/)
--------------------------------
[![Build
Status](https://travis-ci.org/ibotdotout/nimbl3-rai1s.svg)](https://travis-ci.org/ibotdotout/nimbl3-rai1s)
[![Codacy
Badge](https://api.codacy.com/project/badge/grade/47e470ccf79f437381abd54e7a2ec48d)](https://www.codacy.com/app/tkroputa/nimbl3-rai1s)

## Progress:
- Authenticated to use the application  
- Provide Oauth 2 Restful JSON API  
- Only first keyword per file to search on <http://google.com> (Simple Version)  
- Search/store result / keyword result page on Google using crawler web page  

### Unfinish
- Extract large amounts of data from the Google search  
- Search all keyword in csv file  
- Allow users to query the stored data.  


## API

`Failed Authen not reponse on json format`

#### Signup `you can signup but fialed to reponse with json`

```sh
$ curl -H "Content-Type: application/json" -d '{"user":{"email":"test@test.com","password":"12345678"}}' -X
POST http://nimbl3-rai1s.herokuapp.com/users
```

#### Signin

```sh
$ curl -H 'Content-Type: application/json'   -H 'Accept:
application/json' -X POST http://nimbl3-rai1s.herokuapp.com/users/sign_up   -d
'{"user": {"email": "test@test.com", "password": "12345678"}}'
```

Result:
```sh
{"id":1,"email":"test@test.com,"created_at":"2015-11-21T15:39:19.224Z","updated_at":"2015-11-21T15:53:12.472Z","authentication_token":"gCXUbEXMm9pe6cXduWap"}
```

#### Upload CSV

```sh
$ curl -H 'Content-Type: multipart/form-data' -H "Accept:
application/json" -H "X-User-Email: test@test.com" -H
"X-User-Token: gCXUbEXMm9pe6cXduWap" -X POST
http://nimbl3-rai1s.herokuapp.com/upload -F "file=@csv"
```

Result:
```sh
{"job_id":9,"report_id":9}
```


#### Report

```sh
$curl -H "Accept: application/json" -H "Content-type: application/json"
-H "X-User-Email: test@test.com" -H "X-User-Token:
gCXUbEXMm9pe6cXduWap" -X GET http://nimbl3-rai1s.herokuapp.com/report/9
```

Result:
```sh
{"id":1,"job_id":1,"keyword":"phuket
hotel","keyword_index":0,"top_adword":3,"right_adword":8,"total_adword":11,"none_adword":10,"total_link":21,"total_search":"52,700,000","top_adword_url":["www.agoda.com/Phuket_Hotels","www.millenniumhotels.com/Patong","www.traveloka.com/hotel/phuket","www.hotels.com/Phuket_Hotels","www.expedia.co.th/Phuket_Hotels","www.marriott.com/","www.outriggerthailand.com/Phuket","www.tripadvisor.com/Hotels","www.andaraphuket.com/","www.bestwesternhotelasia.com/","www.lastminutehoteldeals4u.com/Phuket"],"right_adword_url":["www.hotels.com/Phuket_Hotels","www.expedia.co.th/Phuket_Hotels","www.marriott.com/","www.outriggerthailand.com/Phuket","www.tripadvisor.com/Hotels","www.andaraphuket.com/","www.bestwesternhotelasia.com/","www.lastminutehoteldeals4u.com/Phuket"],"none_adword_url":["www.tripadvisor.com/Hotels-g293920-Phuket-Hotels.html","www.phuket.com/hotels/","www.agoda.com/city/phuket-th.html","www.booking.com/region/th/phuket.html","www.sawadee.com/hotel/phuket/","www.hotelscombined.com/Place/Phuket.htm","www.hoteltravel.com/thailand/phuket/hotels.htm","www.hotels.com/de1308721/hotels-phuket-thailand/","en.directrooms.com/hotels/subregion/1-1-4/","www.hotelthailand.com/phuket/phuket.html"]}
```
