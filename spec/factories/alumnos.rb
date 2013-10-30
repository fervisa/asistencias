# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :alumno do
    nombre "MyString"
    primer_apellido "MyString"
    segundo_apellido "MyString"
    responsable_nombre "MyString"
    responsable_primer_apellido "MyString"
    responsable_segundo_apellido "MyString"
  end
end
