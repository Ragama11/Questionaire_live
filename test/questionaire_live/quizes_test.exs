defmodule QuestionaireLive.TryTest do
  use QuestionaireLive.DataCase

  alias QuestionaireLive.Quizes

  describe "quizes" do
    alias QuestionaireLive.Quizes.Quiz

    import QuestionaireLive.QuizesFixtures

    @invalid_attrs %{name: nil}

    test "list_quizes/0 returns all quizes" do
      quiz = quiz_fixture()
      assert Quizes.list_quizes() == [quiz]
    end

    test "get_quiz!/1 returns the quiz with given id" do
      quiz = quiz_fixture()
      assert Quizes.get_quiz!(quiz.id) == quiz
    end

    test "create_quiz/1 with valid data creates a quiz" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Quiz{} = quiz} = Try.create_quiz(valid_attrs)
      assert quiz.name == "some name"
    end

    test "create_quiz/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Try.create_quiz(@invalid_attrs)
    end

    test "update_quiz/2 with valid data updates the quiz" do
      quiz = quiz_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Quiz{} = quiz} = Try.update_quiz(quiz, update_attrs)
      assert quiz.name == "some updated name"
    end

    test "update_quiz/2 with invalid data returns error changeset" do
      quiz = quiz_fixture()
      assert {:error, %Ecto.Changeset{}} = Try.update_quiz(quiz, @invalid_attrs)
      assert quiz == Quizes.get_quiz!(quiz.id)
    end

    test "delete_quiz/1 deletes the quiz" do
      quiz = quiz_fixture()
      assert {:ok, %Quiz{}} = Quizes.delete_quiz(quiz)
      assert_raise Ecto.NoResultsError, fn -> Try.get_quiz!(quiz.id) end
    end

    test "change_quiz/1 returns a quiz changeset" do
      quiz = quiz_fixture()
      assert %Ecto.Changeset{} = Quizes.change_quiz(quiz)
    end
  end

  describe "subjects" do
    alias QuestionaireLive.Quizes.Subject

    import QuestionaireLive.QuizesFixtures

    @invalid_attrs %{name: nil}

    test "list_subjects/0 returns all subjects" do
      subject = subject_fixture()
      assert Quizes.list_subjects() == [subject]
    end

    test "get_subject!/1 returns the subject with given id" do
      subject = subject_fixture()
      assert Quizes.get_subject!(subject.id) == subject
    end

    test "create_subject/1 with valid data creates a subject" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Subject{} = subject} = Quizes.create_subject(valid_attrs)
      assert subject.name == "some name"
    end

    test "create_subject/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Quizes.create_subject(@invalid_attrs)
    end

    test "update_subject/2 with valid data updates the subject" do
      subject = subject_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Subject{} = subject} = Quizes.update_subject(subject, update_attrs)
      assert subject.name == "some updated name"
    end

    test "update_subject/2 with invalid data returns error changeset" do
      subject = subject_fixture()
      assert {:error, %Ecto.Changeset{}} = Quizes.update_subject(subject, @invalid_attrs)
      assert subject == Quizes.get_subject!(subject.id)
    end

    test "delete_subject/1 deletes the subject" do
      subject = subject_fixture()
      assert {:ok, %Subject{}} = Quizes.delete_subject(subject)
      assert_raise Ecto.NoResultsError, fn -> Quizes.get_subject!(subject.id) end
    end

    test "change_subject/1 returns a subject changeset" do
      subject = subject_fixture()
      assert %Ecto.Changeset{} = Quizes.change_subject(subject)
    end
  end

  describe "questions" do
    alias QuestionaireLive.Quizes.Question

    import QuestionaireLive.QuizesFixtures

    @invalid_attrs %{question: nil}

    test "list_questions/0 returns all questions" do
      question = question_fixture()
      assert Quizes.list_questions() == [question]
    end

    test "get_question!/1 returns the question with given id" do
      question = question_fixture()
      assert Quizes.get_question!(question.id) == question
    end

    test "create_question/1 with valid data creates a question" do
      valid_attrs = %{question: "some question"}

      assert {:ok, %Question{} = question} = Quizes.create_question(valid_attrs)
      assert question.question == "some question"
    end

    test "create_question/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Quizes.create_question(@invalid_attrs)
    end

    test "update_question/2 with valid data updates the question" do
      question = question_fixture()
      update_attrs = %{question: "some updated question"}

      assert {:ok, %Question{} = question} = Quizes.update_question(question, update_attrs)
      assert question.question == "some updated question"
    end

    test "update_question/2 with invalid data returns error changeset" do
      question = question_fixture()
      assert {:error, %Ecto.Changeset{}} = Quizes.update_question(question, @invalid_attrs)
      assert question == Quizes.get_question!(question.id)
    end

    test "delete_question/1 deletes the question" do
      question = question_fixture()
      assert {:ok, %Question{}} = Quizes.delete_question(question)
      assert_raise Ecto.NoResultsError, fn -> Quizes.get_question!(question.id) end
    end

    test "change_question/1 returns a question changeset" do
      question = question_fixture()
      assert %Ecto.Changeset{} = Quizes.change_question(question)
    end
  end

  describe "answers" do
    alias QuestionaireLive.Quizes.Answer

    import QuestionaireLive.QuizesFixtures

    @invalid_attrs %{value: nil}

    test "list_answers/0 returns all answers" do
      answer = answer_fixture()
      assert Quizes.list_answers() == [answer]
    end

    test "get_answer!/1 returns the answer with given id" do
      answer = answer_fixture()
      assert Quizes.get_answer!(answer.id) == answer
    end

    test "create_answer/1 with valid data creates a answer" do
      valid_attrs = %{value: "some value"}

      assert {:ok, %Answer{} = answer} = Quizes.create_answer(valid_attrs)
      assert answer.value == "some value"
    end

    test "create_answer/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Quizes.create_answer(@invalid_attrs)
    end

    test "update_answer/2 with valid data updates the answer" do
      answer = answer_fixture()
      update_attrs = %{value: "some updated value"}

      assert {:ok, %Answer{} = answer} = Quizes.update_answer(answer, update_attrs)
      assert answer.value == "some updated value"
    end

    test "update_answer/2 with invalid data returns error changeset" do
      answer = answer_fixture()
      assert {:error, %Ecto.Changeset{}} = Quizes.update_answer(answer, @invalid_attrs)
      assert answer == Quizes.get_answer!(answer.id)
    end

    test "delete_answer/1 deletes the answer" do
      answer = answer_fixture()
      assert {:ok, %Answer{}} = Quizes.delete_answer(answer)
      assert_raise Ecto.NoResultsError, fn -> Quizes.get_answer!(answer.id) end
    end

    test "change_answer/1 returns a answer changeset" do
      answer = answer_fixture()
      assert %Ecto.Changeset{} = Quizes.change_answer(answer)
    end
  end

  describe "user_quizes" do
    alias QuestionaireLive.Quizes.User_quiz

    import QuestionaireLive.QuizesFixtures

    @invalid_attrs %{result: nil, status: nil}

    test "list_user_quizes/0 returns all user_quizes" do
      user_quiz = user_quiz_fixture()
      assert Quizes.list_user_quizes() == [user_quiz]
    end

    test "get_user_quiz!/1 returns the user_quiz with given id" do
      user_quiz = user_quiz_fixture()
      assert Quizes.get_user_quiz!(user_quiz.id) == user_quiz
    end

    test "create_user_quiz/1 with valid data creates a user_quiz" do
      valid_attrs = %{result: 42, status: "some status"}

      assert {:ok, %User_quiz{} = user_quiz} = Quizes.create_user_quiz(valid_attrs)
      assert user_quiz.result == 42
      assert user_quiz.status == "some status"
    end

    test "create_user_quiz/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Quizes.create_user_quiz(@invalid_attrs)
    end

    test "update_user_quiz/2 with valid data updates the user_quiz" do
      user_quiz = user_quiz_fixture()
      update_attrs = %{result: 43, status: "some updated status"}

      assert {:ok, %User_quiz{} = user_quiz} = Quizes.update_user_quiz(user_quiz, update_attrs)
      assert user_quiz.result == 43
      assert user_quiz.status == "some updated status"
    end

    test "update_user_quiz/2 with invalid data returns error changeset" do
      user_quiz = user_quiz_fixture()
      assert {:error, %Ecto.Changeset{}} = Quizes.update_user_quiz(user_quiz, @invalid_attrs)
      assert user_quiz == Quizes.get_user_quiz!(user_quiz.id)
    end

    test "delete_user_quiz/1 deletes the user_quiz" do
      user_quiz = user_quiz_fixture()
      assert {:ok, %User_quiz{}} = Quizes.delete_user_quiz(user_quiz)
      assert_raise Ecto.NoResultsError, fn -> Quizes.get_user_quiz!(user_quiz.id) end
    end

    test "change_user_quiz/1 returns a user_quiz changeset" do
      user_quiz = user_quiz_fixture()
      assert %Ecto.Changeset{} = Quizes.change_user_quiz(user_quiz)
    end
  end
end
