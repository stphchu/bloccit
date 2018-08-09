 FactoryBot.define do
   factory :vote do
     post
     value { [1..5].sample }
   end
 end
