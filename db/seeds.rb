# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name => 'Star Wars' }, { name => 'Lord of the Rings' }])
#   Character.create(name => 'Luke', movie: movies.first)

Department.transaction do
    Department.delete_all
    #. . .
    Department.create!(
        :id => 1,
        :name => "QA",
        :actual_funds => 10000.00,
        :available_funds => 10000.00,
    )
    Department.create!(
        :id => 2,
        :name => "RnD",
        :actual_funds => 10000.00,
        :available_funds => 10000.00,
    )
    Department.create!(
        :id => 3,
        :name => "DnD",
        :actual_funds => 10000.00,
        :available_funds => 10000.00,
    )
end

SuperAccount.transaction do
    SuperAccount.delete_all
    SuperAccount.create( :name => 'super' )
  end

Employee.transaction do
    Employee.delete_all
    #. . .
    Employee.create!(
        :id => 1,
        :name => "Emily",
        :address => "Why Did We Include This Circle",
        :department_id => 1,
    )
    Employee.create!(
        :id => 2,
        :name => "Earl",
        :address => "Why Did We Include This Court",
        :department_id => 2,
    )
    Employee.create!(
        :id => 3,
        :name => "Ernie",
        :address => "Why Did We Include This Square",
        :department_id => 3,
    )
end

BudgetApprover.transaction do
    BudgetApprover.delete_all
    #. . .
    BudgetApprover.create!(
        :id => 1,
        :name => "Burt",
        :address => "Why Did We Include This Way",
        :department_id => 1,
    )
    BudgetApprover.create!(
        :id => 2,
        :name => "Becky",
        :address => "Why Did We Include This Lane",
        :department_id => 2,
    )
    BudgetApprover.create!(
        :id => 3,
        :name => "Bogustus",
        :address => "Why Did We Include This Boulevard",
        :department_id => 3,
    )
end

PaymentManager.transaction do
    PaymentManager.delete_all
    #. . .
    PaymentManager.create!(
        :id => 1,
        :name => "Pam",
        :address => "Why Did We Include This Avenue",
        :department_id => 1,
    )
end

Account.transaction do
    Account.delete_all
    #. . .
    Account.create( :email => 'super@depot.com', 
                    :password => 'changeme', 
                    :password_confirmation => 'changeme', 
                    :accountable => SuperAccount.first()
    )
    Account.create!(
        :email => "emily@company.com",
        :password => "changeme",
        :password_confirmation => "changeme",
        :accountable => Employee.find_by_name("Emily"),
    )
    Account.create!(
        :email => "earl@company.com",
        :password => "changeme",
        :password_confirmation => "changeme",
        :accountable => Employee.find_by_name("Earl"),
    )
    Account.create!(
        :email => "ernie@company.com",
        :password => "changeme",
        :password_confirmation => "changeme",
        :accountable => Employee.find_by_name("Ernie"),
    )
    Account.create!(
        :email => "burt@company.com",
        :password => "changeme",
        :password_confirmation => "changeme",
        :accountable => BudgetApprover.find_by_name("Burt"),
    )
    Account.create!(
        :email => "becky@company.com",
        :password => "changeme",
        :password_confirmation => "changeme",
        :accountable => BudgetApprover.find_by_name("Becky"),
    )
    Account.create!(
        :email => "bogustus@company.com",
        :password => "changeme",
        :password_confirmation => "changeme",
        :accountable => BudgetApprover.find_by_name("Bogustus"),
    )
    Account.create!(
        :email => "pam@company.com",
        :password => "changeme",
        :password_confirmation => "changeme",
        :accountable => PaymentManager.find_by_name("Pam"),
    )
end

Taf.transaction do
    #. . .
    Taf.delete_all
    #. . .
    Taf.create!(    :id => 1,
                    :employee_id => Employee.find_by_name("Emily").id,
    )
    Taf.create!(    :id => 2,
                    :employee_id => Employee.find_by_name("Earl").id,
    )
    Taf.create!(    :id => 3,
                    :employee_id => Employee.find_by_name("Ernie").id,
    )
end

Cart.transaction do
    #. . .
    Cart.delete_all
    #. . .
    Cart.create!(   :id => 1,
                    :employee_id => Employee.find_by_name("Emily").id,
    )
    Cart.create!(   :id => 2,
                    :employee_id => Employee.find_by_name("Earl").id,
    )
    Cart.create!(   :id => 3,
                    :employee_id => Employee.find_by_name("Ernie").id,
    )
end

TafItem.transaction do
    TafItem.delete_all
    # . . .
    TafItem.create!(    :id => 1,
                        :taf_id => 1,
                        :employee_id => Employee.find_by_name("Emily").id,
                        :expense_type => 'Travel',
                        :estimated_amount => 600.00,
                        :request_reason => 'One does not simply walk to Jamaca',
                        :dept => 1,
                        :ba_approval => nil,
                        :ba_reason => '',
    )
    TafItem.create!(    :id => 2,
                        :taf_id => 1,
                        :employee_id => Employee.find_by_name("Emily").id,
                        :expense_type => 'Food',
                        :estimated_amount => 50.00,
                        :request_reason => 'What If I told you that I needed to eat',
                        :dept => 2,
                        :ba_approval => nil,
                        :ba_reason => '',
    )
    TafItem.create!(    :id => 3,
                        :taf_id => 1,
                        :employee_id => Employee.find_by_name("Emily").id,
                        :expense_type => 'Lodging',
                        :estimated_amount => 300.00,
                        :request_reason => 'You can\'t rest while enemies are nearby!',
                        :dept => 3,
                        :ba_approval => nil,
                        :ba_reason => '',
    )
    TafItem.create!(    :id => 4,
                        :taf_id => 1,
                        :employee_id => Employee.find_by_name("Emily").id,
                        :expense_type => 'Food',
                        :estimated_amount => 60.00,
                        :request_reason => 'I\'ll be hungry',
                        :dept => 1,
                        :ba_approval => nil,
                        :ba_reason => '',
    )
    TafItem.create!(    :id => 5,                
                        :taf_id => 1,
                        :employee_id => Employee.find_by_name("Emily").id,
                        :expense_type => 'Food',
                        :estimated_amount => 20.00,
                        :request_reason => 'I\'ll be a little less hungry',
                        :dept => 2,
                        :ba_approval => nil,
                        :ba_reason => '',
    )
    TafItem.create!(    :id => 6,
                        :taf_id => 1,
                        :employee_id => Employee.find_by_name("Emily").id,
                        :expense_type => 'Food',
                        :estimated_amount => 60.00,
                        :request_reason => 'Oink.',
                        :dept => 3,
                        :ba_approval => nil,
                        :ba_reason => '',
    )
    TafItem.create!(    :id => 7,
                        :taf_id => 2,
                        :employee_id => Employee.find_by_name("Earl").id,
                        :expense_type => 'Travel',
                        :estimated_amount => 900.00,
                        :request_reason => 'One does not simply walk to England',
                        :dept => 1,
                        :ba_approval => nil,
                        :ba_reason => '',
    )
    TafItem.create!(    :id => 8,
                        :taf_id => 2, 
                        :employee_id => Employee.find_by_name("Earl").id,
                        :expense_type => 'Lodging',
                        :estimated_amount => 1000.00,
                        :request_reason => 'Ye Olde Presidential Suite',
                        :dept => 2,
                        :ba_approval => nil,
                        :ba_reason => '',
    )
    TafItem.create!(    :id => 9,
                        :taf_id => 2,
                        :employee_id => Employee.find_by_name("Earl").id,
                        :expense_type => 'Food',
                        :estimated_amount => 80.00,
                        :request_reason => 'Yes I can eat $80 of food.',
                        :dept => 3,
                        :ba_approval => nil,
                        :ba_reason => '',
    )
    TafItem.create!(    :id => 10,
                        :taf_id => 2,
                        :employee_id => Employee.find_by_name("Earl").id,
                        :expense_type => 'Food',
                        :estimated_amount => 60.00,
                        :request_reason => 'Ye olde 7Eleven',
                        :dept => 1,
                        :ba_approval => nil,
                        :ba_reason => '',
    )
    TafItem.create!(    :id => 11,
                        :taf_id => 2,
                        :employee_id => Employee.find_by_name("Earl").id,
                        :expense_type => 'Food',
                        :estimated_amount => 700.00,
                        :request_reason => 'Fatty ate the whole dinner bar.',
                        :dept => 2,
                        :ba_approval => nil,
                        :ba_reason => '',
    )
    TafItem.create!(    :id => 12,
                        :taf_id => 2,
                        :employee_id => Employee.find_by_name("Earl").id,
                        :expense_type => 'Food',
                        :estimated_amount => 65.00,
                        :request_reason => 'We didn\'t eat at the other place again',
                        :dept => 3,
                        :ba_approval => nil,
                        :ba_reason => '',
    )
    TafItem.create!(    :id => 13,
                        :taf_id => 3,
                        :employee_id => Employee.find_by_name("Ernie").id,
                        :expense_type => 'Travel',
                        :estimated_amount => 120.00,
                        :request_reason => 'Client in the armpit of Florida',
                        :dept => 1,
                        :ba_approval => nil,
                        :ba_reason => '',
    )
    TafItem.create!(    :id => 14,
                        :taf_id => 3,
                        :employee_id => Employee.find_by_name("Ernie").id,
                        :expense_type => 'Lodging',
                        :estimated_amount => 40.00,
                        :request_reason => 'Used to be Motel 6, Florida man knocked it down to Motel 3.2',
                        :dept => 2,
                        :ba_approval => nil,
                        :ba_reason => '',
    )
    TafItem.create!(    :id => 15,
                        :taf_id => 3,
                        :employee_id => Employee.find_by_name("Ernie").id,
                        :expense_type => 'Food',
                        :estimated_amount => 12.00,
                        :request_reason => 'Chicken feet for Florida Man\'s Breakfast',
                        :dept => 3,
                        :ba_approval => nil,
                        :ba_reason => '',
    )
    TafItem.create!(    :id => 16,
                        :taf_id => 3,
                        :employee_id => Employee.find_by_name("Ernie").id,
                        :expense_type => 'Food',
                        :estimated_amount => 11.00,
                        :request_reason => 'Meth for Florida Man\'s Lunch',
                        :dept => 1,
                        :ba_approval => nil,
                        :ba_reason => '',
    )
    TafItem.create!(    :id => 17,
                        :taf_id => 3,
                        :employee_id => Employee.find_by_name("Ernie").id,
                        :expense_type => 'Food',
                        :estimated_amount => 5.00,
                        :request_reason => 'VERY CHEAP VODKA',
                        :dept => 2,
                        :ba_approval => nil,
                        :ba_reason => '',
    )
    TafItem.create!(    :id => 18,
                        :taf_id => 3,
                        :employee_id => Employee.find_by_name("Ernie").id,
                        :expense_type => 'Food',
                        :estimated_amount => 8.00,
                        :request_reason => 'Le candy from ze quickie mart',
                        :dept => 3,
                        :ba_approval => nil,
                        :ba_reason => '',
    )
end

Item.transaction do
    # 
    Item.delete_all
    # . . .
    Item.create!(   :id => 1,
                    :cart_id => 1,
                    :employee_id => Employee.find_by_name("Emily").id,
                    :expense_type => 'Travel',
                    :amount => 600.00,                
                    :department => 1,
                    :ba_approval => nil,
                    :ba_reason => '',
                    :image_url => 'receipt.jpg',  
    )
    Item.create!(   :id => 2,
                    :cart_id => 1,
                    :employee_id => Employee.find_by_name("Emily").id,
                    :expense_type => 'Food',
                    :amount => 50.00,
                    :department => 2,
                    :ba_approval => nil,
                    :ba_reason => '',
                    :image_url => 'receipt2.jpg',
    )
    Item.create!(   :id => 3,
                    :cart_id => 1,
                    :employee_id => Employee.find_by_name("Emily").id,
                    :expense_type => 'Lodging',
                    :amount => 300.00,
                    :department => 3,
                    :ba_approval => nil,
                    :ba_reason => '',
                    :image_url => 'receipt3.jpg',
    )
    Item.create!(   :id => 4,
                    :cart_id => 1,
                    :employee_id => Employee.find_by_name("Emily").id,
                    :expense_type => 'Food',
                    :amount => 60.00,
                    :department => 1,
                    :ba_approval => nil,
                    :ba_reason => '',
                    :image_url => 'receipt4.jpg',
    )
    Item.create!(   :id => 5,
                    :cart_id => 1,
                    :employee_id => Employee.find_by_name("Emily").id,
                    :expense_type => 'Food',
                    :amount => 20.00,
                    :department => 2,
                    :ba_approval => nil,
                    :ba_reason => '',
                    :image_url => 'receipt.jpg',
    )
    Item.create!(   :id =>6,
                    :cart_id => 1,
                    :employee_id => Employee.find_by_name("Emily").id,
                    :expense_type => 'Food',
                    :amount => 60.00,
                    :department => 3,
                    :ba_approval => nil,
                    :ba_reason => '',
                    :image_url => 'receipt2.jpg',
    )
    Item.create!(   :id =>7,
                    :cart_id => 2,
                    :employee_id => Employee.find_by_name("Earl").id,
                    :expense_type => 'Travel',
                    :amount => 900.00,               
                    :department => 1,
                    :ba_approval => nil,
                    :ba_reason => '',
                    :image_url => 'receipt3.jpg',
    )
    Item.create!(   :id =>8,
                    :cart_id => 2,
                    :employee_id => Employee.find_by_name("Earl").id,
                    :expense_type => 'Lodging',
                    :amount => 1000.00,
                    :department => 2,
                    :ba_approval => nil,
                    :ba_reason => '',
                    :image_url => 'receipt4.jpg',
    )
    Item.create!(   :id =>9,
                    :cart_id => 2,
                    :employee_id => Employee.find_by_name("Earl").id,
                    :expense_type => 'Food',
                    :amount => 80.00,
                    :department => 3,
                    :ba_approval => nil,
                    :ba_reason => '',
                    :image_url => 'receipt.jpg',
    )
    Item.create!(   :id =>10,
                    :cart_id => 2,
                    :employee_id => Employee.find_by_name("Earl").id,
                    :expense_type => 'Food',
                    :amount => 60.00,
                    :department => 1,
                    :ba_approval => nil,
                    :ba_reason => '',
                    :image_url => 'receipt2.jpg',
    )
    Item.create!(   :id =>11,
                    :cart_id => 2,
                    :employee_id => Employee.find_by_name("Earl").id,
                    :expense_type => 'Food',
                    :amount => 700.00,
                    :department => 2,
                    :ba_approval => nil,
                    :ba_reason => '',
                    :image_url => 'receipt3.jpg',
    )
    Item.create!(   :id =>12,
                    :cart_id => 2,
                    :employee_id => Employee.find_by_name("Earl").id,
                    :expense_type => 'Food',
                    :amount => 65.00,
                    :department => 3,
                    :ba_approval => nil,
                    :ba_reason => '',
                    :image_url => 'receipt4.jpg',
    )
    Item.create!(   :id =>13,
                    :cart_id => 3,
                    :employee_id => Employee.find_by_name("Ernie").id,
                    :expense_type => 'Travel',
                    :amount => 120.00,
                    :department => 1,
                    :ba_approval => nil,
                    :ba_reason => '',
                    :image_url => 'receipt.jpg',
    )
    Item.create!(   :id =>14,
                    :cart_id => 3,
                    :employee_id => Employee.find_by_name("Ernie").id,
                    :expense_type => 'Lodging',
                    :amount => 40.00,
                    :department => 2,
                    :ba_approval => nil,
                    :ba_reason => '',
                    :image_url => 'receipt2.jpg',
    )
    Item.create!(   :id =>15,
                    :cart_id => 3,
                    :employee_id => Employee.find_by_name("Ernie").id,
                    :expense_type => 'Food',
                    :amount => 12.00,
                    :department => 3,
                    :ba_approval => nil,
                    :ba_reason => '',
                    :image_url => 'receipt3.jpg',
    )
    Item.create!(   :id =>16,
                    :cart_id => 3,
                    :employee_id => Employee.find_by_name("Ernie").id,
                    :expense_type => 'Food',
                    :amount  => 11.00,
                    :department => 1,
                    :ba_approval => nil,
                    :ba_reason => '',
                    :image_url => 'receipt4.jpg',
    )
    Item.create!(   :id =>17,
                    :cart_id => 3,
                    :employee_id => Employee.find_by_name("Ernie").id,
                    :expense_type => 'Food',
                    :amount => 5.00,
                    :department => 2,
                    :ba_approval => nil,
                    :ba_reason => '',
                    :image_url => 'receipt.jpg',
    )
    Item.create!(   :id =>18,
                    :cart_id => 3,
                    :employee_id => Employee.find_by_name("Ernie").id,
                    :expense_type => 'Food',
                    :amount => 8.00,
                    :department => 3,
                    :ba_approval => nil,
                    :ba_reason => '',
                    :image_url => 'receipt.jpg',
    )
end 

