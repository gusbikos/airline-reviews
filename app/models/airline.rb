class Airline < ApplicationRecord
    has_many :reviews

    before_create :slugify # Will set the slug for our airline before we create it in the database.

    def slugify
        self.slug = name.parameterize    # Creates a url-friendly abbreviated name. Parameterize takes the name paramater, hyphonates the spaces
                                        # And lowercases everything
    end

    def avg_score
        reviews.average(:score).round(2).to_f   # Round pushes the decimal two places so we get to the whole number.  Example: 1.00
                                                # Average returns the average number of the elements in the array.  In this case it's reviews
    end
end
