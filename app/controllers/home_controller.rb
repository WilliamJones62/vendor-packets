class HomeController < ApplicationController
  def show
    if current_user.admin?
      @packets = Packet.all
      @percentages = [0, 0, 0, 0, 0, 0]
      @percent0code = []
      @percent0name = []
      @percent0packet = []
      @percent20code = []
      @percent20name = []
      @percent20packet = []
      @percent40code = []
      @percent40name = []
      @percent40packet = []
      @percent60code = []
      @percent60name = []
      @percent60packet = []
      @percent80code = []
      @percent80name = []
      @percent80packet = []
      @percent100code = []
      @percent100name = []
      @percent100packet = []
      @summaries = []
      @packets.each do |packet|
        if packet.additional_integer_1 == 1
            vendor_complete = "true"
            percentage_complete = 20
        else
            vendor_complete = "false"
            percentage_complete = 0
        end
        products_completed = packet.products.where(additional_integer_2: 1).count
        products_array = packet.products.all
        inactive = 0
        products_array.each do |product|
          if product.product_name.include? "INACTIVE"
            inactive = inactive + 1
          end
        end
        total_products = packet.products.all.count - inactive
        if total_products == 0
          products_completed_percentage = 100
        else
          products_completed_percentage = (products_completed * 80) / total_products
        end
        percentage_complete += products_completed_percentage
        if percentage_complete > 100
          percentage_complete = 100
        end
        case percentage_complete
          when 0
            @percentages[0] += 1
            @percent0code.push(packet.vendor_number)
            company_name = packet.company_name.gsub(/\s/, '~')
            @percent0name.push(company_name)
            @percent0packet.push(packet.id)
          when 1..20
            @percentages[1] += 1
            @percent20code.push(packet.vendor_number)
            company_name = packet.company_name.gsub(/\s/, '~')
            @percent20name.push(company_name)
            @percent20packet.push(packet.id)
          when 21..40
            @percentages[2] += 1
            @percent40code.push(packet.vendor_number)
            company_name = packet.company_name.gsub(/\s/, '~')
            @percent40name.push(company_name)
            @percent40packet.push(packet.id)
          when 41..60
            @percentages[3] += 1
            @percent60code.push(packet.vendor_number)
            company_name = packet.company_name.gsub(/\s/, '~')
            @percent60name.push(company_name)
            @percent60packet.push(packet.id)
          when 61..80
            @percentages[4] += 1
            @percent80code.push(packet.vendor_number)
            company_name = packet.company_name.gsub(/\s/, '~')
            @percent80name.push(company_name)
            @percent80packet.push(packet.id)
          else
            @percentages[5] += 1
            @percent100code.push(packet.vendor_number)
            if packet.company_name
              company_name = packet.company_name.gsub(/\s/, '~')
            else
              company_name = ' '
            end
            @percent100name.push(company_name)
            @percent100packet.push(packet.id)
        end

        u = User.where("id = ?", packet.user_id).first
        if u.current_sign_in_at
          current_sign_in_at = u.current_sign_in_at
        else
          current_sign_in_at = " "
        end
        if u.last_sign_in_at
          last_sign_in_at = u.last_sign_in_at
        else
          last_sign_in_at = " "
        end
        s = {:vendor_number => packet.vendor_number, :completed => packet.completed, :vendor_complete => vendor_complete,
             :products_completed => products_completed, :total_products => total_products, :percentage_complete => percentage_complete,
             :current_sign_in_at => current_sign_in_at, :last_sign_in_at => last_sign_in_at, :sign_in_count => u.sign_in_count}
        @summaries.push(s)
      end
    end
  end

  def ftpguides
  end

  def websiteguides
  end

  def inactive
    users = User.all
    @packets = []
    users.each do |u|
      if !u.current_sign_in_at
        packet = Packet.where("user_id = ?", u.id).first
        if packet
          if packet.additional_integer_1 != 1
            # This is a naughty vendor
            @packets.push(packet)
          end
        end
      end
    end
  end

end
