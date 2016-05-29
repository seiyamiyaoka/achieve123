module QuestionsHelper
  def selected_language(question)
    if question.language == 0
      "-"
    elsif question.language == 1
      "ruby"
    elsif question.language == 2
      "PHP"
    elsif question.language == 3
      "C##"
    else
      "その他"
    end
  end

  def selected_category(question)
    if question.category == 0
      "-"
    elsif question.category == 1
      "エラー"
    elsif question.category == 2
      "文法説明"
    elsif question.category == 3
      "ベストな書き方"
    else
      "その他"
    end
  end
end
