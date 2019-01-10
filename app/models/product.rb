class Product < ApplicationRecord
  belongs_to :packet, :foreign_key => "packet_id"
  validates :product_name, presence: true
  validate :mandatory_validation
  validate :claims_documentation
  validate :bug_validation
  validate :case_piece_validation

  def mandatory_validation
    if additional_integer_2 == 1
      if !species.present?
        errors.add(:species, "is required")
      end
      if !vendor_code.present?
        errors.add(:vendor_code, "is required")
      end
      if !vendor_name.present?
        errors.add(:vendor_name, "is required")
      end
      if !product_photo.present?
        errors.add(:product_photo, "is required")
      end
      if !label_type.present?
        errors.add(:label_type, "is required")
      end
      if !label_details.present?
        errors.add(:label_details, "is required")
      end
      if !label.present?
        errors.add(:label, "is required")
      end
      if !safe.present?
        errors.add(:safe, "is required")
      end
      if !production_date.present?
        errors.add(:production_date, "is required")
      end
      if !prod_to_receipt.present?
        errors.add(:prod_to_receipt, "is required")
      end
      if !shelf_life.present?
        errors.add(:shelf_life, "is required")
      end
      if !storage_temp.present?
        errors.add(:storage_temp, "is required")
      end
      if !allergens.present?
        errors.add(:allergens, "is required")
      end
    end
  end

  def claims_documentation
    if additional_integer_2 == 1 && !errors.any?
      if never.present? && withdrawal.present?
        errors.add(:never, "and withdrawal are mutually exclusive")
      end
      if (never.present? || withdrawal.present?) && !never_doc.present?
        errors.add(:never_doc, "is required")
      end
      if withdrawal.present? && !withdrawal_days.present?
        errors.add(:withdrawal_days, "is required")
      end
      if gmo_free.present? && !gmo_free_doc.present?
        errors.add(:gmo_free_doc, "is required")
      end
      if organic.present? && !organic_doc.present?
        errors.add(:organic_doc, "is required")
      end
      if vaccinated.present? && !vaccinated_doc.present?
        errors.add(:vaccinated_doc, "is required")
      end
      if vaccinated.present? && vaccinated_age == 0
        errors.add(:vaccinated_age, "is required")
      end
      if humane.present? && !humane_doc.present?
        errors.add(:humane_doc, "is required")
      end
      if traceable.present? && !traceable_doc.present?
        errors.add(:traceable_doc, "is required")
      end
      if (sqft_inside > 0 || sqft_outside > 0 || sqft_total > 0) && !sqft_doc.present?
        errors.add(:sqft_doc, "is required")
      end
      if pastured.present? && !pastured_doc.present?
        errors.add(:pastured_doc, "is required")
      end
      if omega3.present? && !omega3_doc.present?
        errors.add(:omega3_doc, "is required")
      end
      if vegetable.present? && !vegetable_doc.present?
        errors.add(:vegetable_doc, "is required")
      end
      if additional_integer_3 == 1 && !other_doc.present?
      # other_claims was not created as a boolean so does not work
        errors.add(:other_doc, "is required")
      end
    end
  end

  def bug_validation
    if additional_integer_2 == 1 && !errors.any?
      if additional_integer_1 == 1 && !bug.present?
        errors.add(:bug, "documentation is required")
      end
      if additional_integer_1 == 1 && !usda_approve.present?
        errors.add(:usda_approve, "documentation is required")
      end
    end
  end

  def case_piece_validation
    if additional_integer_2 == 1 && !errors.any?
      if case_piece.present?
        # box
        if !box_type.present?
          errors.add(:box_type, "is required")
        end
        if !box_details.present?
          errors.add(:box_details, "is required")
        end
        if !box_units.present?
          errors.add(:box_units, "is required")
        end
        if !box_length.present?
          errors.add(:box_length, "is required")
        end
        if !box_width.present?
          errors.add(:box_width, "is required")
        end
        if !box_height.present?
          errors.add(:box_height, "is required")
        end
        if !box_count.present?
          errors.add(:box_count, "is required")
        end
        if !piece_count.present?
          errors.add(:piece_count, "is required")
        end
        if !package_photo?
          errors.add(:package_photo, "is required")
        end
      else
        # piece
        if !piece_box.present?
          errors.add(:piece_box, "is required")
        end
        if !piece_pack.present?
          errors.add(:piece_pack, "is required")
        end
        if !piece_count.present?
          errors.add(:piece_count, "is required")
        end
        if !package_photo?
          errors.add(:package_photo, "is required")
        end
      end
    end
  end

end
