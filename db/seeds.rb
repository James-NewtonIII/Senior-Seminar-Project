# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Department.delete_all
#. . .
Department.create!(
    id: 1,
    name: "QA",
    actual_funds: 10000.00,
    available_funds: 10000.00,
)
Department.create!(
    id: 2,
    name: "RnD",
    actual_funds: 10000.00,
    available_funds: 10000.00,
)
Department.create!(
    id: 3,
    name: "DnD",
    actual_funds: 10000.00,
    available_funds: 10000.00,
)

Employee.delete_all
#. . .
Employee.create!(
    id: 1,
    name: "Emily",
    address: "Why Did We Include This Circle",
)
Employee.create!(
    id: 2,
    name: "Earl",
    address: "Why Did We Include This Court",
)
Employee.create!(
    id: 3,
    name: "Ernie",
    address: "Why Did We Include This Square",
)

BudgetApprover.delete_all
#. . .
BudgetApprover.create!(
    id: 1,
    name: "Burt",
    address: "Why Did We Include This Way",
)
BudgetApprover.create!(
    id: 2,
    name: "Becky",
    address: "Why Did We Include This Lane",
)
BudgetApprover.create!(
    id: 3,
    name: "Bogustus",
    address: "Why Did We Include This Boulevard",
)

PaymentManager.delete_all
#. . .
PaymentManager.create!(
    id: 1,
    name: "Pam",
    address: "Why Did We Include This Avenue",
)

Account.delete_all
#. . .
Account.create!(
    email: "emily@company.com",
    password: "changeme",
    password_confirmation: "changeme",
    accountable: Employee.find_by_name("Emily"),
)
Account.create!(
    email: "earl@company.com",
    password: "changeme",
    password_confirmation: "changeme",
    accountable: Employee.find_by_name("Earl"),
)
Account.create!(
    email: "ernie@company.com",
    password: "changeme",
    password_confirmation: "changeme",
    accountable: Employee.find_by_name("Ernie"),
)
Account.create!(
    email: "burt@company.com",
    password: "changeme",
    password_confirmation: "changeme",
    accountable: BudgetApprover.find_by_name("Burt"),
)
Account.create!(
    email: "becky@company.com",
    password: "changeme",
    password_confirmation: "changeme",
    accountable: BudgetApprover.find_by_name("Becky"),
)
Account.create!(
    email: "bogustus@company.com",
    password: "changeme",
    password_confirmation: "changeme",
    accountable: BudgetApprover.find_by_name("Bogustus"),
)
Account.create!(
    email: "pam@company.com",
    password: "changeme",
    password_confirmation: "changeme",
    accountable: PaymentManager.find_by_name("Pam"),
)


TafItem.delete_all
# . . .
TafItem.create!(    id: 1,
                    taf_line_item_id: 1,
                    expense_type: 'Travel',
                    estimated_amount: 600.00,
                    request_reason: 'One does not simply walk to Jamaca',
                    dept: 1,
                    ba_approval: nil,
                    ba_reason: '',
)
TafItem.create!(    id: 2,
                    taf_line_item_id: 2,
                    expense_type: 'Food',
                    estimated_amount: 50.00,
                    request_reason: 'What If I told you that I needed to eat',
                    dept: 2,
                    ba_approval: nil,
                    ba_reason: '',
)
TafItem.create!(    id: 3,
                    taf_line_item_id: 3,
                    expense_type: 'Lodging',
                    estimated_amount: 300.00,
                    request_reason: 'You can\'t rest while enemies are nearby!',
                    dept: 3,
                    ba_approval: nil,
                    ba_reason: '',
)
TafItem.create!(    id: 4,
                    taf_line_item_id: 4,
                    expense_type: 'Food',
                    estimated_amount: 60.00,
                    request_reason: 'I\'ll be hungry',
                    dept: 1,
                    ba_approval: nil,
                    ba_reason: '',
)
TafItem.create!(    id: 5,                
                    taf_line_item_id: 5,
                    expense_type: 'Food',
                    estimated_amount: 20.00,
                    request_reason: 'I\'ll be a little less hungry',
                    dept: 2,
                    ba_approval: nil,
                    ba_reason: '',
)
TafItem.create!(    id: 6,
                    taf_line_item_id: 6,
                    expense_type: 'Food',
                    estimated_amount:60.00,
                    request_reason: 'Oink.',
                    dept: 3,
                    ba_approval: nil,
                    ba_reason: '',
)
TafItem.create!(    id: 7,
                    taf_line_item_id: 7,
                    expense_type: 'Travel',
                    estimated_amount: 900.00,
                    request_reason: 'One does not simply walk to England',
                    dept: 1,
                    ba_approval: nil,
                    ba_reason: '',
)
TafItem.create!(    id: 8,
                    taf_line_item_id: 8,
                    expense_type: 'Lodging',
                    estimated_amount: 1000.00,
                    request_reason: 'Ye Olde Presidential Suite',
                    dept: 2,
                    ba_approval: nil,
                    ba_reason: '',
)
TafItem.create!(    id: 9,
                    taf_line_item_id: 9,
                    expense_type: 'Food',
                    estimated_amount: 80.00,
                    request_reason: 'Yes I can eat $80 of food.',
                    dept: 3,
                    ba_approval: nil,
                    ba_reason: '',
)
TafItem.create!(    id: 10,
                    taf_line_item_id: 10,
                    expense_type: 'Food',
                    estimated_amount: 60.00,
                    request_reason: 'Ye olde 7Eleven',
                    dept: 1,
                    ba_approval: nil,
                    ba_reason: '',
)
TafItem.create!(    id: 11,
                    taf_line_item_id: 11,
                    expense_type: 'Food',
                    estimated_amount: 700.00,
                    request_reason: 'Fatty ate the whole dinner bar.',
                    dept: 2,
                    ba_approval: nil,
                    ba_reason: '',
)
TafItem.create!(    id: 12,
                    taf_line_item_id: 12,
                    expense_type: 'Food',
                    estimated_amount: 65.00,
                    request_reason: 'We didn\'t eat at the other place again',
                    dept: 3,
                    ba_approval: nil,
                    ba_reason: '',
)
TafItem.create!(    id: 13,
                    taf_line_item_id: 13,
                    expense_type: 'Travel',
                    estimated_amount: 120.00,
                    request_reason: 'Client in the armpit of Florida',
                    dept: 1,
                    ba_approval: nil,
                    ba_reason: '',
)
TafItem.create!(    id: 14,
                    taf_line_item_id: 14,
                    expense_type: 'Lodging',
                    estimated_amount: 40.00,
                    request_reason: 'Used to be Motel 6, Florida man knocked it down to Motel 3.2',
                    dept: 2,
                    ba_approval: nil,
                    ba_reason: '',
)
TafItem.create!(    id: 15,
                    taf_line_item_id: 15,
                    expense_type: 'Food',
                    estimated_amount: 12.00,
                    request_reason: 'Chicken feet for Florida Man\'s Breakfast',
                    dept: 3,
                    ba_approval: nil,
                    ba_reason: '',
)
TafItem.create!(    id: 16,
                    taf_line_item_id: 16,
                    expense_type: 'Food',
                    estimated_amount: 11.00,
                    request_reason: 'Meth for Florida Man\'s Lunch',
                    dept: 1,
                    ba_approval: nil,
                    ba_reason: '',
)
TafItem.create!(    id: 17,
                    taf_line_item_id: 17,
                    expense_type: 'Food',
                    estimated_amount: 5.00,
                    request_reason: 'VERY CHEAP VODKA',
                    dept: 2,
                    ba_approval: nil,
                    ba_reason: '',
)
TafItem.create!(    id: 18,
                    taf_line_item_id: 18,
                    expense_type: 'Food',
                    estimated_amount: 8.00,
                    request_reason: 'Le candy from ze quickie mart',
                    dept: 3,
                    ba_approval: nil,
                    ba_reason: '',
)

#. . .
Taf.delete_all
#. . .
Taf.create!(   id: 1,
)
Taf.create!(   id: 2,
)
Taf.create!(   id: 3,
)

#. . .
TafLineItem.delete_all
#. . .
TafLineItem.create!(
    id: 1,
    taf_item_id: 1,
    taf_id: 1,
)
TafLineItem.create!(
    id: 2,
    taf_item_id: 2,
    taf_id: 1,
)
TafLineItem.create!(
    id: 3,
    taf_item_id: 3,
    taf_id: 1,
)
TafLineItem.create!(
    id: 4,
    taf_item_id: 4,
    taf_id: 1,
)
TafLineItem.create!(
    id: 5,
    taf_item_id: 5,
    taf_id: 1,
)
TafLineItem.create!(
    id: 6,
    taf_item_id: 6,
    taf_id: 1,
)
TafLineItem.create!(
    id: 7,
    taf_item_id: 7,
    taf_id: 2,
)
TafLineItem.create!(
    id: 8,
    taf_item_id: 8,
    taf_id: 2,
)
TafLineItem.create!(
    id: 9,
    taf_item_id: 9,
    taf_id: 2,
)
TafLineItem.create!(
    id: 10,
    taf_item_id: 10,
    taf_id: 2,
)
TafLineItem.create!(
    id: 11,
    taf_item_id: 11,
    taf_id: 2,
)
TafLineItem.create!(
    id: 12,
    taf_item_id: 12,
    taf_id: 2,
)
TafLineItem.create!(
    id: 13,
    taf_item_id: 13,
    taf_id: 3,
)
TafLineItem.create!(
    id: 14,
    taf_item_id: 14,
    taf_id: 3,
)
TafLineItem.create!(
    id: 15,
    taf_item_id: 15,
    taf_id: 3,
)
TafLineItem.create!(
    id: 16,
    taf_item_id: 16,
    taf_id: 3,
)
TafLineItem.create!(
    id: 17,
    taf_item_id: 17,
    taf_id: 3,
)
TafLineItem.create!(
    id: 18,
    taf_item_id: 18,
    taf_id: 3,
)


# 
Item.delete_all
# . . .
Item.create!(   id: 1,
                expense_type: 'Travel',
                amount: 600.00,
                department: 1,
                ba_approval: nil,
                ba_reason: '',
                image_url: 'receipt.jpg',
                
)
Item.create!(   id:2,
                expense_type: 'Food',
                amount: 50.00,
                department: 2,
                ba_approval: nil,
                ba_reason: '',
                image_url: 'receipt2.jpg',
)
Item.create!(   id:3,
                expense_type: 'Lodging',
                amount: 300.00,
                department: 3,
                ba_approval: nil,
                ba_reason: '',
                image_url: 'receipt3.jpg',
)
Item.create!(   id:4,
                expense_type: 'Food',
                amount: 60.00,
                department: 1,
                ba_approval: nil,
                ba_reason: '',
                image_url: 'receipt4.jpg',
)
Item.create!(   id:5,
                expense_type: 'Food',
                amount: 20.00,
                department: 2,
                ba_approval: nil,
                ba_reason: '',
                image_url: 'receipt.jpg',
)
Item.create!(   id:6,
                expense_type: 'Food',
                amount:60.00,
                department: 3,
                ba_approval: nil,
                ba_reason: '',
                image_url: 'receipt2.jpg',
)
Item.create!(   id:7,
                expense_type: 'Travel',
                amount: 900.00,
                department: 1,
                ba_approval: nil,
                ba_reason: '',
                image_url: 'receipt3.jpg',
)
Item.create!(   id:8,
                expense_type: 'Lodging',
                amount: 1000.00,
                department: 2,
                ba_approval: nil,
                ba_reason: '',
                image_url: 'receipt4.jpg',
)
Item.create!(   id:9,
                expense_type: 'Food',
                amount: 80.00,
                department: 3,
                ba_approval: nil,
                ba_reason: '',
                image_url: 'receipt.jpg',
)
Item.create!(   id:10,
                expense_type: 'Food',
                amount: 60.00,
                department: 1,
                ba_approval: nil,
                ba_reason: '',
                image_url: 'receipt2.jpg',
)
Item.create!(   id:11,
                expense_type: 'Food',
                amount: 700.00,
                department: 2,
                ba_approval: nil,
                ba_reason: '',
                image_url: 'receipt3.jpg',
)
Item.create!(   id:12,
                expense_type: 'Food',
                amount: 65.00,
                department: 3,
                ba_approval: nil,
                ba_reason: '',
                image_url: 'receipt4.jpg',
)
Item.create!(   id:13,
                expense_type: 'Travel',
                amount: 120.00,
                department: 1,
                ba_approval: nil,
                ba_reason: '',
                image_url: 'receipt.jpg',
)
Item.create!(   id:14,
                expense_type: 'Lodging',
                amount: 40.00,
                department: 2,
                ba_approval: nil,
                ba_reason: '',
                image_url: 'receipt2.jpg',
)
Item.create!(   id:15,
                expense_type: 'Food',
                amount: 12.00,
                department: 3,
                ba_approval: nil,
                ba_reason: '',
                image_url: 'receipt3.jpg',
)
Item.create!(   id:16,
                expense_type: 'Food',
                amount: 11.00,
                department: 1,
                ba_approval: nil,
                ba_reason: '',
                image_url: 'receipt4.jpg',
)
Item.create!(   id:17,
                expense_type: 'Food',
                amount: 5.00,
                department: 2,
                ba_approval: nil,
                ba_reason: '',
                image_url: 'receipt.jpg',
)
Item.create!(   id:18,
                expense_type: 'Food',
                amount: 8.00,
                department: 3,
                ba_approval: nil,
                ba_reason: '',
                image_url: 'receipt.jpg',
)

#. . .
Cart.delete_all
#. . .
Cart.create!(   id: 1,
)
Cart.create!(   id: 2,
)
Cart.create!(   id: 3,
)

#. . .
LineItem.delete_all
#. . .
LineItem.create!(
    id: 1,
    item_id: 1,
    cart_id: 1,
)
LineItem.create!(
    id: 2,
    item_id: 2,
    cart_id: 1,
)
LineItem.create!(
    id: 3,
    item_id: 3,
    cart_id: 1,
)
LineItem.create!(
    id: 4,
    item_id: 4,
    cart_id: 1,
)
LineItem.create!(
    id: 5,
    item_id: 5,
    cart_id: 1,
)
LineItem.create!(
    id: 6,
    item_id: 6,
    cart_id: 1,
)
LineItem.create!(
    id: 7,
    item_id: 7,
    cart_id: 2,
)
LineItem.create!(
    id: 8,
    item_id: 8,
    cart_id: 2,
)
LineItem.create!(
    id: 9,
    item_id: 9,
    cart_id: 2,
)
LineItem.create!(
    id: 10,
    item_id: 10,
    cart_id: 2,
)
LineItem.create!(
    id: 11,
    item_id: 11,
    cart_id: 2,
)
LineItem.create!(
    id: 12,
    item_id: 12,
    cart_id: 2,
)
LineItem.create!(
    id: 13,
    item_id: 13,
    cart_id: 3,
)
LineItem.create!(
    id: 14,
    item_id: 14,
    cart_id: 3,
)
LineItem.create!(
    id: 15,
    item_id: 15,
    cart_id: 3,
)
LineItem.create!(
    id: 16,
    item_id: 16,
    cart_id: 3,
)
LineItem.create!(
    id: 17,
    item_id: 17,
    cart_id: 3,
)
LineItem.create!(
    id: 18,
    item_id: 18,
    cart_id: 3,
)

SuperAccount.transaction do
    SuperAccount.delete_all
    SuperAccount.create( :name => 'super' )
  end

  Account.transaction do
    Account.create( :email => 'super@depot.com', :password => 'changeme', :password_confirmation => 'changeme', 
                    :accountable => SuperAccount.first())
  end