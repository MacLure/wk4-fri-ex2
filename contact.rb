gem 'activerecord', '=4.2.10'

require "./crm.rb"
require 'active_record'
require 'mini_record'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'crm.sqlite3')

class Contact < ActiveRecord::Base

  field :first_name, as: :string
  field :last_name,  as: :string
  field :email,      as: :string
  field :note,       as: :text

  def full_name
    "#{ first_name } #{ last_name }"
  end
end

Contact.auto_upgrade!

at_exit do
  ActiveRecord::Base.connection.close
end

# betty = Contact.create(
#       first_name: "Betty",
#       last_name:  "Maker",
#       email:      "af@asdf.com",
#       note:       "Betty's note"
#     )



# class Contact

#   @@contacts = []
#   @@id = 1

#     # This method should call the initializer, 
#     # store the newly created contact, and then return it
#   def self.create(first_name, last_name, email, note)
#     new_contact = Contact.new(first_name, last_name, email, note)
#     @@contacts << new_contact
#     return new_contact
#   end

#   def self.contacts
#     return @@contacts
#   end


#   # This method should return all of the existing contacts
#   def self.all
#     return @@contacts
#   end

#   # This method should accept an id as an argument
#   # and return the contact who has that id
#   def self.find(id)
#     # return @@contacts.select{|contact| contact.id == id}

#     @@contacts.each do |contact|
#       if contact.id == id
#         return contact
#       end
#     end
#   end

#   # This method should work similarly to the find method above
#   # but it should allow you to search for a contact using attributes other than id
#   # by specifying both the name of the attribute and the value
#   # eg. searching for 'first_name', 'Betty' should return the first contact named Betty

#   def self.find_by(attribute, value)
#     if attribute == "first_name"
#       return @@contacts.select{|contact| contact.first_name == value}
#     end
#     if attribute == "last_name"
#       return @@contacts.select{|contact| contact.last_name == value}
#     end
#     if attribute == "email"
#       return @@contacts.select{|contact| contact.email == value}
#     end
#     if attribute == "note"
#       return @@contacts.select{|contact| contact.note == value}
#     end

#     # return @@contacts.select{|contact| contact.first_name == value}
#   end

#   # This method should delete all of the contacts
#   def self.delete_all
#     @@contacts = []

#     # counter = @@contacts.length
#     # while counter >= 0 do
#     #   @@contacts.delete_at(counter)
#     #   counter -= 1
#     # end
#     # @@id = 1
#   end

#   # This method should initialize the contact's attributes
#   def initialize(first_name, last_name, email, note)
#     @first_name = first_name
#     @last_name = last_name
#     @email = email
#     @note = note
#     @id = @@id
#     @@id += 1 # this way the next contact will get a different id
#   end


#   #readers
#   def first_name
#     @first_name
#   end

#   def last_name
#     @last_name
#   end

#   def email
#     @email
#   end

#   def note
#     @note
#   end

#   def id
#     @id
#   end

#   # a setter (*set* the value of an attribute)
#   def first_name=(first_name)
#     @first_name = first_name
#   end

#   def last_name=(last_name)
#     @last_name = last_name
#   end

#   def email=(email)
#     @email = email
#   end
  
#   def note=(note)
#     @note = note
#   end

#   # This method should allow you to specify 
#   # 1. which of the contact's attributes you want to update
#   # 2. the new value for that attribute
#   # and then make the appropriate change to the contact
#   def update(attribute, value)
#     attribute = value
#   end

#   def full_name
#     return "#{first_name} #{last_name}"
#   end

#   # This method should delete the contact
#   # HINT: Check the Array class docs for built-in methods that might be useful here
#   def delete
#     @@contacts.delete(self)
#   end

#   # Feel free to add other methods here, if you need them.
  
# end
