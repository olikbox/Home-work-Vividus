# EPAM.com checks



Scenario: 1. Check the title is correct
Given I am on main application page
When I wait until the page has the title 'EPAM | Software Engineering & Product Development Services'
When I close browser



Scenario: 2. Check the ability to switch Light/Dark mode
Given I am on main application page
When I click on element located by `By.xpath(//button[@id='onetrust-accept-btn-handler'])`
When I click on element located by `By.xpath(//a[@class='header__logo-container desktop-logo']/following-sibling::section[@class='theme-switcher-ui'])`
When I wait until element located by `By.xpath(//body[contains(@class, 'light-mode')])` appears
When I click on element located by `By.xpath(//a[@class='header__logo-container desktop-logo']/following-sibling::section[@class='theme-switcher-ui'])`
When I wait until element located by `By.xpath(//body[contains(@class, 'dark-mode')])` appears



Scenario: 3. Check that allow to change language to UA
Given I am on main application page
When I click on element located by `By.xpath(//ul[@class="header__controls"]//button [contains(@class, 'location-selector')])`
When I wait until element located by `By.xpath(//button[@class="location-selector__button opened" and @aria-expanded="true"])` appears
When I click on element located by `By.xpath(//nav[@class="location-selector__panel"]//a[normalize-space(text())="Україна"])`
When I wait until element located by `By.xpath(//div[@class="location-selector-ui header__control"]/button[text()="Україна (UA)"])` appears



Scenario: 3. Check the policies list
Given I am on main application page
When I scroll element located by `By.xpath(//div[@class="policies"])` into view
When I wait until element located by `By.xpath(//a[contains(., 'INVESTORS')])` appears
When I wait until element located by `By.xpath(//a[contains(., 'COOKIE POLICY')])` appears
When I wait until element located by `By.xpath(//a[contains(., 'OPEN SOURCE')])` appears
When I wait until element located by `By.xpath(//a[contains(., 'APPLICANT PRIVACY NOTICE')])` appears
When I wait until element located by `By.xpath(//a[contains(., 'PRIVACY POLICY')])` appears
When I wait until element located by `By.xpath(//a[contains(., 'WEB ACCESSIBILITY')])` appears



Scenario: 5. Check that allow to switch location list by region
Given I am on main application page
When I scroll element located by `By.xpath(//span[@class='museo-sans-light' and normalize-space(.)='Our Locations'])` into view
When I wait until element located by `By.xpath(//a[contains(@class,'tabs-23__link') and (text()='AMERICAS')])` appears
When I wait until element located by `By.xpath(//a[contains(@class,'tabs-23__link') and (text()='EMEA')])` appears
When I wait until element located by `By.xpath(//a[contains(@class,'tabs-23__link') and (text()='APAC')])` appears
When I click on element located by `By.xpath(//a[contains(@class,'tabs-23__link') and (text()='EMEA')])`
When I wait until element located by `By.xpath(//a[contains(@class,'tabs-23__link') and (text()='EMEA') and (@aria-selected="true")])` appears



Scenario: 6. Check the search function
Given I am on main application page
When I click on element located by `By.xpath(//span[contains(@class, "search-icon")])`
When I wait until element located by `By.xpath(//div[@class="header-search__panel opened"])` appears
When I enter `EPAM` in field located by `By.xpath(//input[@id="new_form_search"])`
When I click on element located by `By.xpath(//span[normalize-space(text())="Find"])`
When I wait until element located by `By.xpath(//h2[@class="search-results__counter"])` appears



Scenario: 7. Check form's fields validation
Given I am on page with URL `https://www.epam.com/about/who-we-are/contact`
When I wait until element located by `By.xpath(//label[contains(text(), 'First Name*')]/following-sibling::input[@aria-required='true'])` appears
When I wait until element located by `By.xpath(//label[contains(text(), 'Last Name*')]/following-sibling::input[@aria-required='true'])` appears
When I wait until element located by `By.xpath(//label[contains(text(), 'Email*')]/following-sibling::input[@aria-required='true'])` appears
When I wait until element located by `By.xpath(//label[contains(text(), 'Phone*')]/following-sibling::input[@aria-required='true'])` appears
When I wait until element located by `By.xpath(//label[contains(text(), 'Location*')]/ancestor::div[@class='country-field-ui location-fields__column'][@data-required='true'])` appears
When I wait until element located by `By.xpath(//label[contains(text(), 'Select the Reason for Your Inquiry*')]/parent::div[@class='dropdown-list-ui'][@data-required='true'])` appears
When I wait until element located by `By.xpath(//label[contains(., 'How did you hear about EPAM?*')]/ancestor::div[@data-required='true'])` appears



Scenario: 8. Check that the Company logo on the header leads to the main page
Given I am on page with URL `https://www.epam.com/about`
When I click on element located by `By.xpath(//a[@class='header__logo-container desktop-logo'])`
Then the page with the URL 'https://www.epam.com/' is loaded



Scenario: 9. Check that allows to download report
Given I am on page with URL `https://www.epam.com/about`
When I click on element located by `By.xpath(//a[contains(@class, 'button-ui-23') and contains(.,'DOWNLOAD')])`
