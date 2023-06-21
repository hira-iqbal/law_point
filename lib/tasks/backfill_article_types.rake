desc "Backfill ArticleType Table"
task backfill_article_types: :environment do
  ArticleType.find_or_create_by(display_name: 'Criminal', name: 'criminal' )
  ArticleType.find_or_create_by(display_name: 'Accident', name: 'accident')
  ArticleType.find_or_create_by(display_name: 'Divorce', name:'divorce' )
  ArticleType.find_or_create_by(display_name: 'Industrial', name: 'industrial' )
  ArticleType.find_or_create_by(display_name: 'Business', name: 'business')
  ArticleType.find_or_create_by(display_name: 'Family', name: 'Family')
end
