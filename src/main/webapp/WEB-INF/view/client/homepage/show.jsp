<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta http-equiv="X-UA-Compatible" content="IE=edge">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Pizza hut clone</title>
                <link rel="Shortcut icon" type="image" href="/client/images/pizza hut logo.png">
                <link rel="stylesheet" href="/client/css/style.css">
                <link rel="stylesheet" href="/client/css/utility.css">
                <script defer src="/client/js/script.js"></script>
            </head>

            <body>
                <header>
                    <nav>
                        <div class="logo"> <img src="/client/images/pizza hut logo 2.png"></div>
                        <div class="basketlogo " onclick="basketshow()"><img src="/client/images/icons/basket.webp"
                                alt=""></div>

                        <jsp:include page="../layout/cart.jsp" />

                        <ul>
                            <div class="itembar">
                                <a class="boxitems active" id="deals" href="index.html">Deals</a>
                                <a class="boxitems" href="pizza.html">Pizzas</a>
                                <a class="boxitems" href="sides.html">Sides</a>
                                <a class="boxitems" href="desserts.html">Desserts</a>
                                <a class="boxitems" href="drinks.html">Drinks</a>
                        </ul>
                        </div>
                    </nav>
                </header>

                <body class="container">
                    <div class="flex-container">
                        <div class="flex-item"><img src="/client/images/deals/deals1st.jpg" alt="">
                            <p class="mainname"> Super Value Deal:2 Medium Pizzas starting at Rs 599</p>
                            <p class="subdetails">Choose any 2 of your favorite medium pizza</p>
                            <p class="price"> &#8377 599
                                <span class="previouseprice">&#8377 1000</span>
                                <button class="customisebtn">Customise your deal</button>
                            </p>
                        </div>
                        <div class="flex-item"><img src="/client/images/deals/deals2nd.jpg" alt="">
                            <p class="mainname">1 Plus 1 San Fransisco Style</p>
                            <p class="subdetails">Choose any 2 of your favorite personal pizza with new San Fransisco
                                Crust</p>
                            <p class="price"> &#8377 249
                                <button class="customisebtn">Customise your deal</button>
                            </p>
                        </div>
                        <div class="flex-item"><img src="/client/images/deals/deals3.jpg" alt="">
                            <p class="mainname">Hut Treat Box 4 San Francisco Style</p>
                            <p class="subdetails">2 Med Pizza with new San Fransisco Crust, 1 Garlic Breadstix, 1 Creamy
                                Garlic
                                Breadstix, 2 Pepsi Pet Bottles</p>
                            <p class="price"> &#8377 749
                                <span class="previouseprice">&#8377 1170</span>
                                <button class="customisebtn">Customise your deal</button>
                            </p>
                        </div>
                        <div class="flex-item"><img src="/client/images/deals/deals4.jpg" alt="">
                            <p class="mainname">Magic Pizza Box (4 Veg Pizza) @ Rs.435</p>
                            <p class="subdetails">4 Personal Magic pizza (1 Onion, 1 Corn, 1 Paneer & Capsicum, 1 Onion
                                & Capsicum
                            </p>
                            <p class="price"> &#8377 395
                                <button class="customisebtn">Customise your deal</button>
                            </p>
                        </div>
                        <div class="flex-item"><img src="/client/images/deals/deals5.jpg" alt="">
                            <p class="mainname">Magic Pizza Box (2 Veg Pizzas + 2 Non Veg Pizzas)</p>
                            <p class="subdetails">4 Personal Magic pizza (1 Onion, 1 Corn, 2 Meatball & Onion)</p>
                            <p class="price"> &#8377 445
                                <button class="customisebtn">Customise your deal</button>
                            </p>
                        </div>
                        <div class="flex-item"><img src="/client/images/deals/deals6.jpg" alt="">
                            <p class="mainname">Super Value Deal: 2 Personal Pizzas starting at Rs 249</p>
                            <p class="subdetails">Choose any 2 of your favorite personal pizza </p>
                            <p class="price"> &#8377 249
                                <button class="customisebtn">Customise your deal</button>
                            </p>
                        </div>
                        <div class="flex-item"><img src="/client/images/deals/deals7.jpg" alt="">
                            <p class="mainname">Meal For 2 with Pizza & Garlic Bread</p>
                            <p class="subdetails">2 Personal Pizza Upto Veg Signature/Non Veg Delight, 1 Garlic Bread
                                Stix</p>
                            <p class="price"> &#8377 399
                                <span class="previouseprice">&#8377 637</span>
                                <button class="customisebtn">Customise your deal</button>
                            </p>
                        </div>
                        <div class="flex-item"><img src="/client/images/deals/deals8.jpg" alt="">
                            <p class="mainname">Stuffed Crust - Meal for 2</p>
                            <p class="subdetails">Delicious Meal for 2 with great choice of pizzas and signature crust
                                with pepsi
                            </p>
                            <p class="price"> &#8377 469
                                <button class="customisebtn">Customise your deal</button>
                            </p>
                        </div>
                        <div class="flex-item"><img src="/client/images/deals/deals9.jpg" alt="">
                            <p class="mainname">Momo Mia Meal for 1</p>
                            <p class="subdetails">EPIC "Meal for 1" deal - Get 1 Personal Momo Mia pizza + 1 Pepsi PET
                            </p>
                            <p class="price"> &#8377 299
                                <span class="previouseprice">&#8377 326</span>
                                <button class="customisebtn">Customise your deal</button>
                            </p>
                        </div>
                        <div class="flex-item" id="mediadeal1"><img src="/client/images/deals/deals10.jpg" alt="">
                            <p class="mainname">MY BOX PASTA starting @209</p>
                            <p class="subdetails">Meal for 1:1 Pasta, 2 Pc Plain Garlic Bread & 1 Pepsi Pet Bottle</p>
                            <p class="price"> &#8377 199
                                <button class="customisebtn">Customise your deal</button>
                            </p>
                        </div>

                    </div>

                </body>
                <footer>

                </footer>
            </body>

            </html>