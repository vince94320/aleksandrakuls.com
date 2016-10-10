def db
  @db ||= begin
    data_source = InlineDataDb.new(yml_file_paths: 'source/{views,pages}/**/_*')
    partial_localized_data = data_source.data[current_lang.to_s]
    page_localized_data = current_page.data[current_lang.to_s]
    localized_data = partial_localized_data.merge(page_localized_data.to_h)

    JSON.parse(localized_data.to_json, object_class: OpenStruct)
  end
end

def news
  NewsRepository.new.all(language: current_lang)
end

def concerts
  ConcertsRepository.new.all(language: current_lang)
end

def gallery_photos
  PhotosRepository.new.all_for_gallery(language: current_lang)
end

def music_list
  MusicRepository.new.all(language: current_lang)
end

def reviews
  ReviewsRepository.new.all(language: current_lang)
end
