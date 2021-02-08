class AddressAdminsController < ApplicationController

	# registration#newの次、住所登録するviewを表示するためのアクション。
	# ただし、registraion#newでrenderしてる（実質、registration#newアクションの見た目をaddress_admin#newにしてるだけ）
	# なので、ここは何も書かなくていい。
	def new
	end

	def create
		# ここでadminも保存してしまっているのは、一回のリクエストで一つのコントローラ#アクションにしかいけないから
		# 今回でいうと、住所登録した後、admin::registration#create行って、その後address_admin#createに行く、とかRailsの仕組み上できない。
		# なんで、もう一つの正解をいうと、admin::registration#createにそのままこのコードを写してもいい。
		@admin = Admin.new(session["devise.regist_data"]["admin"])
		@address = AddressAdmin.new(address_params) # <= addressAdminへの代入ってここですんでる。

		unless @address.valid?
			render :new and return
		end
		# attributesは、インスタンスのカラムに対応した値(@address)を、hashに変換するメソッド。
		# @admin.build_address(@address.attributes) # <= ここでさらに二重に代入

		@admin.save
		@address.save
		session["devise.regist_data"]["admin"].clear
		sign_in(:admin, @admin)
		redirect_to :root
	end


	def address_params
		params.require(:address_admin).permit(:postal_code, :area, :city, :block_number, :phone_number, :house_number)
	end
end