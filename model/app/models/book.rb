class Book < ActiveRecord::Base
    validates :isbn,
        presence: true, #빈값이 아니라, 존재해야한다
        uniqueness: true, # 유일한 데이터여야한다(중복X)
        length: {is: 17}, #17자리 수여야 한다
        format: {with: /\A[0-9]{3}-[0-9]{1}-[0-9]{3,5}-[0-9]{4}-[0-9X]{1}\z/ } #정규표현식?!
    
    validates :name,
        presence: true,
        length: {minimum: 1, maximum: 100}
    validates :price,
        numericality: {only_integer: :true, less_than: 10000}
    validates :publish,
        inclusion: { in: ['제이펍', '멋사단국대', '한빛미디어']}
end
