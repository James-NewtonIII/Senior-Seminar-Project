# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
TafItem.delete_all
# . . .
TafItem.create!(    expense_type: 'Travel',
                    estimated_amount: 600.00,
                    request_reason: '',
                    dept: '',
                    ba_approval: nil,
                    ba_reason: '',
)
TafItem.create!(    expense_type: 'Food',
                    estimated_amount: 50.00,
                    request_reason: '',
                    dept: '',
                    ba_approval: nil,
                    ba_reason: '',
)
TafItem.create!(    expense_type: 'Lodging',
                    estimated_amount: 300.00,
                    request_reason: '',
                    dept: '',
                    ba_approval: nil,
                    ba_reason: '',
)
TafItem.create!(    expense_type: 'Food',
                    estimated_amount: 60.00,
                    request_reason: '',
                    dept: '',
                    ba_approval: nil,
                    ba_reason: '',
)
TafItem.create!(    expense_type: 'Food',
                    estimated_amount: 20.00,
                    request_reason: '',
                    dept: '',
                    ba_approval: nil,
                    ba_reason: '',
)
TafItem.create!(    expense_type: 'Food',
                    estimated_amount:60.00,
                    request_reason: '',
                    dept: '',
                    ba_approval: nil,
                    ba_reason: '',
)
TafItem.create!(   expense_type: 'Travel',
                    estimated_amount: 900.00,
                    request_reason: '',
                    dept: '',
                    ba_approval: nil,
                    ba_reason: '',
)
TafItem.create!(   expense_type: 'Lodging',
                estimated_amount: 1000.00,
                request_reason: '',
                dept: '',
                ba_approval: false,
                ba_reason: '',
)
TafItem.create!(   expense_type: 'Food',
                estimated_amount: 80.00,
                request_reason: '',
                dept: '',
                ba_approval: false,
                ba_reason: '',
)
TafItem.create!(   expense_type: 'Food',
                estimated_amount: 60.00,
                request_reason: '',
                dept: '',
                ba_approval: false,
                ba_reason: '',
)
TafItem.create!(   expense_type: 'Food',
                estimated_amount: 700.00,
                request_reason: '',
                dept: '',
                ba_approval: false,
                ba_reason: '',
)
TafItem.create!(   expense_type: 'Food',
                estimated_amount: 65.00,
                request_reason: '',
                dept: '',
                ba_approval: false,
                ba_reason: '',
)
TafItem.create!(   expense_type: 'Travel',
                estimated_amount: 120.00,
                request_reason: '',
                dept: '',
                ba_approval: false,
                ba_reason: '',
)
TafItem.create!(   expense_type: 'Lodging',
                estimated_amount: 40.00,
                request_reason: '',
                dept: '',
                ba_approval: false,
                ba_reason: '',
)
TafItem.create!(   expense_type: 'Food',
                estimated_amount: 12.00,
                request_reason: '',
                dept: '',
                ba_approval: false,
                ba_reason: '',
)
TafItem.create!(   expense_type: 'Food',
                estimated_amount: 11.00,
                request_reason: '',
                dept: '',
                ba_approval: false,
                ba_reason: '',
)
TafItem.create!(   expense_type: 'Food',
                estimated_amount: 5.00,
                request_reason: '',
                dept: '',
                ba_approval: false,
                ba_reason: '',
)

# 
Item.delete_all
# . . .
Item.create!(   expense_type: 'Travel',
                amount: 600.00,
                department: '',
                ba_approval: nil,
                ba_reason: '',
                image_url: 'receipt.jpg',
                
)
Item.create!(   expense_type: 'Food',
                amount: 50.00,
                department: '',
                ba_approval: nil,
                ba_reason: '',
                image_url: 'receipt2.jpg',
)
Item.create!(   expense_type: 'Lodging',
                amount: 300.00,
                department: '',
                ba_approval: nil,
                ba_reason: '',
                image_url: 'receipt3.jpg',
)
Item.create!(   expense_type: 'Food',
                amount: 60.00,
                department: '',
                ba_approval: nil,
                ba_reason: '',
                image_url: 'receipt4.jpg',
)
Item.create!(   expense_type: 'Food',
                amount: 20.00,
                department: '',
                ba_approval: nil,
                ba_reason: '',
                image_url: 'receipt.jpg',
)
Item.create!(   expense_type: 'Food',
                amount:60.00,
                department: '',
                ba_approval: nil,
                ba_reason: '',
                image_url: 'receipt2.jpg',
)
Item.create!(   expense_type: 'Travel',
                amount: 900.00,
                department: '',
                ba_approval: nil,
                ba_reason: '',
                image_url: 'receipt3.jpg',
)
Item.create!(   expense_type: 'Lodging',
                amount: 1000.00,
                department: '',
                ba_approval: nil,
                ba_reason: '',
                image_url: 'receipt4.jpg',
)
Item.create!(   expense_type: 'Food',
                amount: 80.00,
                department: '',
                ba_approval: nil,
                ba_reason: '',
                image_url: 'receipt.jpg',
)
Item.create!(   expense_type: 'Food',
                amount: 60.00,
                department: '',
                ba_approval: nil,
                ba_reason: '',
                image_url: 'receipt2.jpg',
)
Item.create!(   expense_type: 'Food',
                amount: 700.00,
                department: '',
                ba_approval: nil,
                ba_reason: '',
                image_url: 'receipt3.jpg',
)
Item.create!(   expense_type: 'Food',
                amount: 65.00,
                department: '',
                ba_approval: nil,
                ba_reason: '',
                image_url: 'receipt4.jpg',
)
Item.create!(   expense_type: 'Travel',
                amount: 120.00,
                department: '',
                ba_approval: nil,
                ba_reason: '',
                image_url: 'receipt.jpg',
)
Item.create!(   expense_type: 'Lodging',
                amount: 40.00,
                department: '',
                ba_approval: nil,
                ba_reason: '',
                image_url: 'receipt2.jpg',
)
Item.create!(   expense_type: 'Food',
                amount: 12.00,
                department: '',
                ba_approval: nil,
                ba_reason: '',
                image_url: 'receipt3.jpg',
)
Item.create!(   expense_type: 'Food',
                amount: 11.00,
                department: '',
                ba_approval: nil,
                ba_reason: '',
                image_url: 'receipt4.jpg',
)
Item.create!(   expense_type: 'Food',
                amount: 5.00,
                department: '',
                ba_approval: nil,
                ba_reason: '',
                image_url: 'receipt.jpg',
)


