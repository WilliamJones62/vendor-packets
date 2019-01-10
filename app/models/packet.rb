class Packet < ApplicationRecord
  belongs_to :user, :foreign_key => "user_id"
  has_many :products, inverse_of: :packet, :dependent => :destroy
  validate :mandatory_validation
  validate :recall_validation
  validate :usda_2_validation
  validate :usda_3_validation

  def self.to_csv
    attributes = %w{vendor_number company_name primary_contact phone_1 phone_2 email ops_name ops_phone_1 ops_phone_2 ops_email qa_name qa_phone_1 qa_phone_2 qa_email haccp_1_type haccp_1_company problems_2 haccp_1_score haccp_1_expires haccp_1_scheduled haccp_2_type haccp_2_company problems_3 haccp_2_score haccp_2_expires haccp_2_scheduled}
    CSV.generate(headers: true) do |csv|
      csv << attributes
      all.each do |packet|
        csv << packet.attributes.values_at(*attributes)
      end
    end
  end

  def mandatory_validation
    if additional_integer_1 == 1
      if !primary_contact.present?
        errors.add(:primary_contact, "is required")
      end
      if !phone_1.present?
        errors.add(:phone_1, "is required")
      end
      if !email.present?
        errors.add(:email, "is required")
      end
      if !qa_name.present?
        errors.add(:qa_name, "is required")
      end
      if !qa_phone_1.present?
        errors.add(:qa_phone_1, "is required")
      end
      if !qa_email.present?
        errors.add(:qa_email, "is required")
      end
      if !ops_name.present?
        errors.add(:ops_name, "is required")
      end
      if !ops_phone_1.present?
        errors.add(:ops_phone_1, "is required")
      end
      if !ops_email.present?
        errors.add(:ops_email, "is required")
      end
      if !usda_establishment_number_1.present?
        errors.add(:usda_establishment_number_1, "is required")
      end
      if !usda_establishment_name_1.present?
        errors.add(:usda_establishment_name_1, "is required")
      end
      if !mock_recall_sop_1.present?
        errors.add(:mock_recall_sop_1, "is required")
      end
      if !mock_recall_date_1.present?
        errors.add(:mock_recall_date_1, "is required")
      end
      if !bone_foreign_1.present?
        errors.add(:bone_foreign_1, "is required")
      end
      if !complaint_1.present?
        errors.add(:complaint_1, "is required")
      end
      if !haccp_1_certificate.present?
        errors.add(:haccp_1_certificate, "is required")
      end
      if !haccp_1_expires.present?
        errors.add(:haccp_1_expires, "is required")
      end
      if !haccp_1_scheduled.present?
        errors.add(:haccp_1_scheduled, "is required")
      end
      if !problems_2.present?
        errors.add(:problems_2, "is required")
      end
      if !haccp_1_type.present?
        errors.add(:haccp_1_type, "is required")
      end
      if !haccp_1_company.present?
        errors.add(:haccp_1_company, "is required")
      end
      if !haccp_1_score.present?
        errors.add(:haccp_1_score, "is required")
      end
      if !additional_string_1.present?
        errors.add(:additional_string_1, "is required")
      end
      if !additional_string_2.present?
        errors.add(:additional_string_2, "is required")
      end
      if !website.present?
        errors.add(:website, "is required")
      end
      if !non_disclosure.present?
        errors.add(:non_disclosure, "is required")
      end
      if !w9.present?
        errors.add(:w9, "is required")
      end
      if !liability.present?
        errors.add(:liability, "is required")
      end
      if !guarantee.present?
        errors.add(:guarantee, "is required")
      end
    end
  end

  def recall_validation
    if additional_integer_1 == 1 && !errors.any?
      if recall_this_year_1.present? && !recall_1.present?
        errors.add(:recall_1, "documentation is required")
      end
      if recall_this_year_2.present? && !recall_2.present?
        errors.add(:recall_2, "documentation is required")
      end
      if recall_this_year_3.present? && !recall_3.present?
        errors.add(:recall_3, "documentation is required")
      end
    end
  end

  def usda_2_validation
    if additional_integer_1 == 1 && !errors.any?
      if usda_establishment_number_2.present?
        if !usda_establishment_name_2.present?
          errors.add(:usda_establishment_name_2, "is required")
        end
        if !mock_recall_sop_2.present?
          errors.add(:mock_recall_sop_2, "is required")
        end
        if !mock_recall_date_2.present?
          errors.add(:mock_recall_date_2, "is required")
        end
        if !bone_foreign_2.present?
          errors.add(:bone_foreign_2, "is required")
        end
        if !complaint_2.present?
          errors.add(:complaint_2, "is required")
        end
        if !haccp_2_certificate.present?
          errors.add(:haccp_2_certificate, "is required")
        end
        if !haccp_2_expires.present?
          errors.add(:haccp_2_expires, "is required")
        end
        if !haccp_2_scheduled.present?
          errors.add(:haccp_2_scheduled, "is required")
        end
        if !problems_3.present?
          errors.add(:problems_3, "is required")
        end
        if !haccp_2_type.present?
          errors.add(:haccp_2_type, "is required")
        end
        if !haccp_2_company.present?
          errors.add(:haccp_2_company, "is required")
        end
        if !haccp_2_score.present?
          errors.add(:haccp_2_score, "is required")
        end
        if !additional_string_3.present?
          errors.add(:additional_string_3, "is required")
        end
        if !additional_string_4.present?
          errors.add(:additional_string_4, "is required")
        end
      end
    end
  end

  def usda_3_validation
    if additional_integer_1 == 1 && !errors.any?
      if usda_establishment_number_3.present?
        if !usda_establishment_name_3.present?
          errors.add(:usda_establishment_name_3, "is required")
        end
        if !mock_recall_sop_3.present?
          errors.add(:mock_recall_sop_3, "is required")
        end
        if !mock_recall_date_3.present?
          errors.add(:mock_recall_date_3, "is required")
        end
        if !bone_foreign_3.present?
          errors.add(:bone_foreign_3, "is required")
        end
        if !complaint_3.present?
          errors.add(:complaint_3, "is required")
        end
        if !haccp_3_certificate.present?
          errors.add(:haccp_3_certificate, "is required")
        end
        if !haccp_3_expires.present?
          errors.add(:haccp_3_expires, "is required")
        end
        if !haccp_3_scheduled.present?
          errors.add(:haccp_3_scheduled, "is required")
        end
        if !qa_phone_1_ext.present?
          errors.add(:qa_phone_1_ext, "is required")
        end
        if !haccp_3_type.present?
          errors.add(:haccp_3_type, "is required")
        end
        if !haccp_3_company.present?
          errors.add(:haccp_3_company, "is required")
        end
        if !haccp_3_score.present?
          errors.add(:haccp_3_score, "is required")
        end
        if !additional_string_5.present?
          errors.add(:additional_string_5, "is required")
        end
        if !problems_1.present?
          errors.add(:problems_1, "is required")
        end
      end
    end
  end

  def self.import(file)
    CSV.foreach(file.path, headers:true) do |row|
      Packet.create! row.to_hash
    end
  end

end
