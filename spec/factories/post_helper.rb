FactoryBot.define do
  factory :subject_post, class: SubjectPost do
    id {"1"}
    user_id {"1"}
    img {"xxxxxx.img"}
    association :user #@postモデルは@userが投稿するので、関連付けを定義する。
  end
end
