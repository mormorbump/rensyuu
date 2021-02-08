class Address < ApplicationRecord
  belongs_to :user, optional: true
  # concernにファイルと同じ名前でmoduleを作り、その中に共通化したい処理をおく。
  # 呼び出したい側でinclude
  include Addressable
end
