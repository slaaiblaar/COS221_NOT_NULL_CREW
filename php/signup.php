<?php session_start(); setcookie("InsideUsers", "False", 0, "/");setcookie("InsideSignup", "True", 0, "/");
    if(!isset($_COOKIE['showRegPopupAdd'])){
        setcookie("showRegPopupAdd", "false", 0, "/");
    }
?>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="../css/signup.css">
        <title> Sunrise Golfing/Sign Up </title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.4/css/fontawesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://kit.fontawesome.com/1af5f85004.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
        <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    </head>
    <body>
        <div class="loaderFlag">
            <div>
                <img src="../img/flag-in-hole-joypixels.gif" alt="Flag Loader">
            </div>
        </div>
        <div class="content">
            <div class="top-content">
                <img id="Logo" src="../img/Golf-full-logo-transparent.png" width="150" height="150">
                <h1 id="webTitle">Sunrise Golfing</h1>  
            </div> 
            <?php
                include_once("header.php");
            ?>
            <div id="signupForm">
                <form action="validateSignup.php" method="post" class="signupForm"> <!-- onsubmit="return ValidateInput()"> -->
                    <div class="container">
                        <h1>Sign Up</h1>
                        <p>Please fill in this form to create an account.</p>
                        
                        <?php if(!empty($_SESSION['messages'])) {
                            if ($_SESSION['messages'] == "Invalid Submission. That email address is already in use"){
                                $_SESSION['email'] = "";
                                echo "<h3 style='color: red; font-weight: bold;'> Invalid submission. Email address already in use. </h3>";
                                echo "<script> document.querySelector('.email').style.borderColor = 'red'; </script>";
                            }
                            else if ($_SESSION['messages'] == 'Invalid Email. The email must be in the format: something@example.com'){
                                $_SESSION['email'] = "";
                                echo "<h3 style='color: red; font-weight: bold;'> Invalid Email. The email must be in the format: something@example.com </h3>";
                                echo "<script> document.querySelector('.email').style.borderColor = 'red'; </script>";
                            }
                            else if ($_SESSION['messages'] == 'Invalid Name. The name must start with a capital and can only contain characters [a-z].'){
                                $_SESSION['name'] = "";
                                echo "<h3 style='color: red; font-weight: bold;'> Invalid Name. The name must start with a capital and can only contain characters [a-z]. </h3>";
                                echo "<script> document.querySelector('.name').style.borderColor = 'red'; </script>";
                            }
                            else if ($_SESSION['messages'] == 'Invalid Surname. The surname must start with a capital and can only contain characters [a-z].'){
                                $_SESSION['surname'] = "";
                                echo "<h3 style='color: red; font-weight: bold;'> Invalid Surname. The surname must start with a capital and can only contain characters [a-z]. </h3>";
                                echo "<script> document.querySelector('.surname').style.borderColor = 'red'; </script>";
                            }
                            else if ($_SESSION['messages'] == 'Invalid initials. The initials must start with a capital and can only contain characters [a-z].'){
                                $_SESSION['initials'] = "";
                                echo "<h3 style='color: red; font-weight: bold;'> Invalid initials. The initials must start with a capital and can only contain characters [a-z]. </h3>";
                                echo "<script> document.querySelector('.initials').style.borderColor = 'red'; </script>";
                            }
                            else if ($_SESSION['messages'] == 'Invalid Password. It needs to contain: at least 8 characters, uppercase and lowercase characters, numeric digits and at least one symbol [&,%,$,etc.]'){
                                $_SESSION['psw'] = "";
                                echo "<h3 style='color: red; font-weight: bold;'> Invalid Password. It needs to contain: at least 8 characters, uppercase and lowercase characters, numeric digits and at least one symbol [&,%,$,etc.] </h3>";
                                echo "<script> document.querySelector('.password').style.borderColor = 'red'; </script>";
                            }
                            else if ($_SESSION['messages'] == 'Invalid telephone number. Please ensure that your telephone number only contains digits.'){
                                $_SESSION['telNo'] = "";
                                echo "<h3 style='color: red; font-weight: bold;'> Invalid telephone number. Please ensure that your telephone number only contains digits.</h3>";
                                echo "<script> document.querySelector('.telNo').style.borderColor = 'red'; </script>";
                            }
                            else if ($_SESSION['messages'] == 'You did specify whether you are a player or an admin. Please do so.'){
                                $_SESSION['userType'] = "";
                                echo "<h3 style='color: red; font-weight: bold;'> You did specify whether you are a player or an admin. Please do so.</h3>";
                                echo "<script> document.querySelector('.userType').style.borderColor = 'red'; </script>";
                            }
                            else {$_SESSION['name'] = "";
                                $_SESSION['surname'] = "";
                                $_SESSION['email'] = "";
                                $_SESSION['psw'] = "";
                                $_SESSION['country']="";
                                $_SESSION['handicap']="";
                                $_SESSION['telNo']="";
                                $_SESSION['initials']="";

                                echo "<h3 style='color: red; font-weight: bold;'> Invalid submission. Please take note of the following when filling in the form: </h3>
                                        <ul style='color: red; font-weight: bold;'>
                                            <li class='error'> Name should start with a capital letter and only have characters [A-Z] or [a-z].</li>
                                            <li class='error'> Surname should start with a capital letter and only have characters [A-Z] or [a-z].</li>
                                            <li class='error'> Initials should start with a capital letter and only have characters [A-Z].</li>
                                            <li class='error'> Telephone Number must be in valid format e.g. 012 345 6789</li>
                                            <li class='error'> Email should have the format - something@example.com.</li>
                                            <li class='error'> Password must consist of at least 8 characters, uppercase and lowercase letters, at least one digit and one symbol(&,%,$,etc.).</li>
                                        </ul>";
                            }
                        } ?>

                        <hr>

                        <div class="inputTextBox">
                            <label for="name"><b>Name</b></label><br>
                            <input class= 'name' type="text" placeholder="Enter Name" name="name" required max_length = '45'>
                            <div class="error"></div><br>
                        </div>
                        <div class="inputTextBox" >
                            <label for="surname"><b>Surname</b></label><br>
                            <input class="surname" type="text" placeholder="Enter Surname" name="surname" required max_length = '45'>
                            <div class="error"></div><br>
                        </div>
                        <div class="inputTextBox" >
                            <label for="initials"><b>Initials (optional) </b></label><br>
                            <input class="initials" type="text" placeholder="Enter Initials" name="initials" max_length = '45'>
                            <div class="error"></div><br>
                        </div>
                        <div class="userType_TelNo">
                            <div class="inputTextBox">
                                <label for="userType"><b>Type of User</b></label><br>
                                <input class="adminType" type="radio" name="userType" value="Admin">
                                <label for="adminType"><b>Admin</b></label><br>
                                <input class="playerType" type="radio" name="userType" value="Player">
                                <label for="playerType"><b>Player</b></label><br>
                                <div class="error"></div><br>
                            </div>
                            <div class="inputTextBox">
                                <label for="telNo"><b>Tel No.</b></label><br>
                                <input class="telNo" type="text" placeholder="Enter your Telefone Number" name="telNo" required>
                                <div class="error"></div><br>
                            </div>
                        </div>
                        <div class="inputTextBox">
                            <label for="email"><b>Email</b></label><br>
                            <input class="email" type="text" placeholder="Enter Email" name="email" required>
                            <div class="error"></div><br>
                        </div>
                        <div class="inputTextBox">
                            <label for="psw"><b>Password</b></label><br>
                            <input class="password" type="password" placeholder="Enter Password" name="psw" required>
                            <i id="togglePsw"><span id="icon" class="material-icons">visibility</span></i>
                            <div class="error"></div><br>
                        </div>

                        <div class="clearfix">
                            <button type="button" class="cancelbtn"><a href="login.php">Cancel</a></button>
                            <button type="submit" class="signupbtn" name="Submit">Sign Up</button>
                        </div>
                        <div class="linkContainer">
                            <div class="loginLink">
                                <a href="login.php"> Already a user? Go to Login. </a>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="fullscreenPopup">
                <div id="SuccessfulRegPopup">
                    <h1> Successful Registration </h1>
                    <img src="../img/flag-in-hole-joypixels.gif" alt="Flag Loader" width="100" height="100">
                    <div class="popupButtons">
                        <button type="button" class="undoReg">Undo Registration</button>
                        <button type="button" class="dismissPopup">Dismiss</button>
                    </div>
                </div>
            </div>
        </div>
        <?php 
            if(isset($_COOKIE['showRegPopupAdd']) && $_COOKIE['showRegPopupAdd']=="true"){
                echo"<script> document.querySelector('.fullScreenPopup').style.visibility = 'visible';</script>";
            }
        ?>
         
        <?php
            include_once("footer.php");
        ?>
        <script language="Javascript" type="text/javascript" src="../js/inputValidationSignUp.js"></script>
        <script language="Javascript" type="text/javascript" src="../js/registrationPopupSignup.js"></script>
        <script language="Javascript" type="text/javascript" src="../js/passwordToggle.js"></script>
        <script language="Javascript" type="text/javascript" src="../js/loaderFlag.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    </body>
</html>
<?php session_unset(); session_destroy(); ?>
<!--

    Test if the input for country is correct by using this list:

       Afhanistan">Afhanistan
       Albania">Albania
       Algeria">Algeria
       Andorro">Andorro
       Angola">Angola
       Antigua and Barbuda">Antigua and Barbuda
       Argentina">Argentina
       Armenia">Armenia
       Australia">Australia
       Austria">Austria
       Azerbaijan">Azerbaijan
       Bahamas">Bahamas
       Bahrain">Bahrain
       Bangladesh">Bangladesh
       Barbados">Barbados
       Belarus">Belarus
       Belgium">Belgium
       Belize">Belize
       Benin">Benin
       Bhutan">Bhutan
       Bolivia">Bolivia
       Bosnia and Herzegovina">Bosnia and Herzegovina
       Botswana">Botswana
       Brazil">Brazil
       Brunei">Brunei
       Bulgaria">Bulgaria
       Burkina Faso">Burkina Faso
       Burundi">Burundi
       Côte d'Ivoire">Côte d'Ivoire
       Cabo Verde">Cabo Verde
       Cambodia">Cambodia
       Cameroon">Cameroon
       Canada">Canada
       Central African Republic">Central African Republic
       Chad">Chad
       Chile">Chile
       China">China
       Colombia">Colombia
       Congo">Congo
       Costa Rica">Costa Rica
       Croatia">Croatia
       Cuba">Cuba
       Cyprus">Cyprus
       Czech Republic">Czech Republic
       Democratic Republic of the Congo">Democratic Republic of the Congo
       Denmark">Denmark
       Djibouti">Djibouti
       Dominica">Dominica
       Dominican Republi">Dominican Republi
       Ecuador">Ecuador
       Egypt">Egypt
       El Salvador">El Salvador
       Equatorial Guinea">Equatorial Guinea
       Eritrea">Eritrea
       Estonia">Estonia
       Swaziland">Swaziland
       Ethiopia">Ethiopia
       Fiji">Fiji
       Finland">Finland
       France">France
       Gabon">Gabon
       Gambia">Gambia
       Georgia">Georgia
       Germany">Germany
       Ghana">Ghana
       Greece">Greece
       Grenada">Grenada
       Guatemala">Guatemala
       Guinea">Guinea
       Guinea-Bissau">Guinea-Bissau
       Guyana">Guyana
       Haiti">Haiti
       Holy See">Holy See
       Honduras">Honduras
       Hungary">Hungary
       Iceland">Iceland
       India">India
       Indonesia">Indonesia
       Iran">Iran
       Iraq">Iraq
       Ireland">Ireland
       Israel">Israel
       Italy">Italy
       Jamaica">Jamaica
       Japan">Japan
       Jordan">Jordan
       Kazakhstan">Kazakhstan
       Kenya">Kenya
       Kiribati">Kiribati
       Kuwait">Kuwait
       Kyrgyzstan">Kyrgyzstan
       Laos">Laos
       Latvia">Latvia
       Lebanon">Lebanon
       Lesotho">Lesotho
       Liberia">Liberia
       Libya">Libya
       Liechtenstein">Liechtenstein
       Lithuania">Lithuania
       Luxembourg">Luxembourg
       Madagascar">Madagascar
       Malawi">Malawi
       Malaysia">Malaysia
       Maldives">Maldives
       Mali">Mali
       Malta">Malta
       Marshall Islands">Marshall Islands
       Mauritania">Mauritania
       Mauritius">Mauritius
       Mexico">Mexico
       Micronesia">Micronesia
       Moldova">Moldova
       Monaco">Monaco
       Mongolia">Mongolia
       Montenegro">Montenegro
       Morocco">Morocco
       Mozambique">Mozambique
       Myanmar">Myanmar
       Namibia">Namibia
       Nauru">Nauru
       Nepal">Nepal
       Netherlands">Netherlands
       New Zealand">New Zealand
       Nicaragua">Nicaragua
       Niger">Niger
       Nigeria">Nigeria
       North Korea">North Korea
       North Macedonia">North Macedonia
       Norway">Norway
       Oman">Oman
       Pakistan">Pakistan
       Palau">Palau
       Palestine State">Palestine State
       Panama">Panama
       Papua New Guinea">Papua New Guinea
       Paraguay">Paraguay
       Peru">Peru
       Philippines">Philippines
       Poland">Poland
       Portugal">Portugal
       Qatar">Qatar
       Romania">Romania
       Russia">Russia
       Rwanda">Rwanda
       Saint Kitts and Nevis">Saint Kitts and Nevis
       Saint Lucia">Saint Lucia
       Saint Vincent and the Grenadines">Saint Vincent and the Grenadines
       Samoa">Samoa
       San Marino">San Marino
       Sao Tome and Principe">Sao Tome and Principe
       Saudi Arabia">Saudi Arabia
       Senegal">Senegal
       Serbia">Serbia
       Seychelles">Seychelles
       Sierra Leone">Sierra Leone
       Singapore">Singapore
       Slovakia">Slovakia
       Slovenia">Slovenia
       Solomon Islands">Solomon Islands
       Somalia">Somalia
       South Africa">South Africa
       South Korea">South Korea
       South Sudan">South Sudan
       Spain">Spain
       Sri Lanka">Sri Lanka
       Sudan">Sudan
       Suriname">Suriname
       Sweden">Sweden
       Switzerland">Switzerland
       Syria">Syria
       Tajikistan">Tajikistan
       Tanzania">Tanzania
       Thailand">Thailand
       Timor-Leste">Timor-Leste
       Togo">Togo
       Tonga">Tonga
       Trinidad and Tobago">Trinidad and Tobago
       Tunisia">Tunisia
       Turkey">Turkey
       Turkmenistan">Turkmenistan
       Tuvalu">Tuvalu
       Uganda">Uganda
       Ukraine">Ukraine
       United Arab Emirates">United Arab Emirates
       United Kingdom">United Kingdom
       United States of America">United States of America
       Uruguay">Uruguay
       Uzbekistan">Uzbekistan
       Vanuatu
       Venezuela
       Vietnam
       Yemen
       Zambia
       Zimbabwe
    </select>
-->