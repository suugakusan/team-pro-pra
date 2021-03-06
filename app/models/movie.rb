class Movie < ApplicationRecord
  RAILS_GENRE_LIST = %w[basic git ruby rails]
  PHP_GENRE_LIST = %w[php]

  def self.genre_list(genre)
    if genre == "php"
      where(genre: Movie::PHP_GENRE_LIST)
    else
      where(genre: Movie::RAILS_GENRE_LIST)
    end
  end

  with_options presence: true do
    validates :genre
    validates :title
    validates :url
  end
  enum genre: {
    invisible: 0, # 非表示
    basic: 1,
    git: 2,
    ruby: 3,
    rails: 4,
    php: 5
  }
end
