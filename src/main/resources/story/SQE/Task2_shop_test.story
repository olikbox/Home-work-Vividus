#Use public e-shop site >> https://demowebshop.tricentis.com/



Lifecycle:
Examples:
{transformer=FROM_LANDSCAPE}
|email       |#{generate(Internet.emailAddress)} |
|firstName   |#{generate(Name.firstName)}        |
|lastName    |#{generate(Name.lastName)}      	 |
|password    |#{generate(Internet.password)}	 |



Scenario: 1. Verify that allows register a User
Given I am on page with URL `https://demowebshop.tricentis.com/`

When I click on element located by `By.xpath(//a[text()='Register'])`
When I wait until element located by `By.xpath(//h1[text()='Register'])` appears
When I click on element located by `By.xpath(//input[@id='gender-female'])`
When I enter `<firstName>` in field located by `By.xpath(//input[@id='FirstName'])`
When I enter `<lastName>` in field located by `By.xpath(//input[@id='LastName'])`
When I enter `<email>` in field located by `By.xpath(//input[@id='Email'])`
When I enter `<password>` in field located by `By.xpath(//input[@id='Password'])`
When I enter `<password>` in field located by `By.xpath(//input[@id='ConfirmPassword'])`
When I click on element located by `By.xpath(//input[@id='register-button'])`
When I wait until element located by `By.xpath(//div[@class='result'][contains(., 'Your registration completed')])` appears
When I click on element located by `By.xpath(//a[@class='ico-logout'])`






Scenario: 2. Verify that allows login a User
Given I am on page with URL `https://demowebshop.tricentis.com/`

When I click on element located by `By.xpath(//a[@class='ico-login'])`
When I wait until element located by `By.xpath(//h1[text()='Welcome, Please Sign In!'])` appears
When I enter `<email>` in field located by `By.xpath(//input[@id='Email'])`
When I enter `<password>` in field located by `By.xpath(//input[@id='Password'])`
When I click on element located by `By.xpath(//input[@id='RememberMe'])`
When I click on element located by `By.xpath(//input[@value='Log in'])`
When I wait until element located by `By.xpath(//div[@class='header-links']//a[@class='account'])` appears
When I click on element located by `By.xpath(//a[@class='ico-logout'])`






Scenario: 3. Verify that ‘Computers’ group has 3 sub-groups with correct names
Given I am on page with URL `https://demowebshop.tricentis.com/`

When I click on element located by `By.xpath(//ul[@class="top-menu"]//a[normalize-space(text())='Computers'])`
When I wait until element located by `By.xpath(//ul[@class='sublist']//a[contains(text(), 'Desktops')])` appears
When I wait until element located by `By.xpath(//ul[@class='sublist']//a[contains(text(), 'Notebooks')])` appears
When I wait until element located by `By.xpath(//ul[@class='sublist']//a[contains(text(), 'Accessories')])` appears






Scenario: 4. Verify that allows sorting items (different options)
Given I am on page with URL `https://demowebshop.tricentis.com/desktops`

When I click on element located by `By.xpath(//select[@id="products-orderby"])`
When I click on element located by `By.xpath(//select[@id="products-orderby"]/option[text()="Name: A to Z"])`
When I wait until element located by `By.xpath(//select[@id='products-orderby']/option[text()='Name: A to Z' and @selected='selected'])` appears
When I click on element located by `By.xpath(//select[@id="products-orderby"])`
When I click on element located by `By.xpath(//select[@id="products-orderby"]/option[text()="Name: Z to A"])`
When I wait until element located by `By.xpath(//select[@id='products-orderby']/option[text()='Name: Z to A' and @selected='selected'])` appears
When I click on element located by `By.xpath(//select[@id="products-orderby"])`
When I click on element located by `By.xpath(//select[@id="products-orderby"]/option[text()="Price: Low to High"])`
When I wait until element located by `By.xpath(//select[@id='products-orderby']/option[text()='Price: Low to High' and @selected='selected'])` appears
When I click on element located by `By.xpath(//select[@id="products-orderby"])`
When I click on element located by `By.xpath(//select[@id="products-orderby"]/option[text()="Price: High to Low"])`
When I wait until element located by `By.xpath(//select[@id='products-orderby']/option[text()='Price: High to Low' and @selected='selected'])` appears
When I click on element located by `By.xpath(//select[@id="products-orderby"])`
When I click on element located by `By.xpath(//select[@id="products-orderby"]/option[text()="Created on"])`
When I wait until element located by `By.xpath(//select[@id='products-orderby']/option[text()='Created on' and @selected='selected'])` appears






Scenario: 5. Verify that allows changing number of items on page
Given I am on page with URL `https://demowebshop.tricentis.com/desktops`

When I click on element located by `By.xpath(//select[@id='products-pagesize'])`
When I click on element located by `By.xpath(//option[text()='12'])`
When I wait until element located by `By.xpath(//option[@selected='selected' and text()='12'])` appears
When I click on element located by `By.xpath(//select[@id='products-pagesize'])`
When I click on element located by `By.xpath(//option[text()='4'])`
When I wait until element located by `By.xpath(//option[@selected='selected' and text()='4'])` appears
When I click on element located by `By.xpath(//select[@id='products-pagesize'])`
When I click on element located by `By.xpath(//option[text()='8'])`
When I wait until element located by `By.xpath(//option[@selected='selected' and text()='8'])` appears







Scenario: 6. Verify that allows adding an item to the Wishlist
Given I am on page with URL `https://demowebshop.tricentis.com/accessories`

When I click on element located by `By.xpath(//a[text()="TCP Public MT/AT"])`
Then the page with the URL 'https://demowebshop.tricentis.com/copy-of-tcp-self-paced-training' is loaded
When I click on element located by `By.xpath(//input[@value="Add to wishlist"])`
When I wait until element located by `By.xpath(//a[@class='ico-wishlist']/span[@class='wishlist-qty'][text()='(1)'])` appears





Scenario: 7 Verify that allows adding an item to the card
Given I am on page with URL `https://demowebshop.tricentis.com/accessories`

When I click on element located by `By.xpath(//h2[@class='product-title']/a[text()='TCP Public MT/AT'])`
Then the page with the URL 'https://demowebshop.tricentis.com/copy-of-tcp-self-paced-training' is loaded
When I click on element located by `By.xpath(//div[@class="add-to-cart"]//input[@value="Add to cart"])`
When I click on element located by `By.xpath(//li[@id='topcartlink']//span[@class='cart-qty'][text()='(1)'])`




Scenario: 8 Verify that allows removing an item from the card
When I click on element located by `By.xpath(//input[@name="removefromcart"])`
When I click on element located by `By.xpath(//input[@value="Update shopping cart"])`
When I wait until element located by `By.xpath(//*[contains(text(), 'Your Shopping Cart is empty!')])` appears





Scenario: 9. Verify that allows checkout an item
Given I am on page with URL `https://demowebshop.tricentis.com/`

When I click on element located by `By.xpath(//a[@class='ico-login'])`
When I wait until element located by `By.xpath(//h1[text()='Welcome, Please Sign In!'])` appears
When I enter `<email>` in field located by `By.xpath(//input[@id='Email'])`
When I enter `<password>` in field located by `By.xpath(//input[@id='Password'])`
When I click on element located by `By.xpath(//input[@id='RememberMe'])`
When I click on element located by `By.xpath(//input[@value='Log in'])`
When I wait until element located by `By.xpath(//div[@class='header-links']//a[@class='account'])` appears
When I go to relative URL `accessories`
When I click on element located by `By.xpath(//h2[@class='product-title']/a[text()='TCP Public MT/AT'])`
Then the page with the URL 'https://demowebshop.tricentis.com/copy-of-tcp-self-paced-training' is loaded

When I click on element located by `By.xpath(//div[@class="add-to-cart"]//input[@value="Add to cart"])`
When I click on element located by `By.xpath(//li[@id='topcartlink'])`
When I click on element located by `By.xpath(//input[@id='termsofservice'])`
When I click on element located by `By.xpath(//button[@id="checkout"])`
When I wait until element located by `By.xpath(//h1[text()='Checkout'])` appears
