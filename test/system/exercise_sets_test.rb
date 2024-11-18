require "application_system_test_case"

class ExerciseSetsTest < ApplicationSystemTestCase
  setup do
    @exercise_set = exercise_sets(:one)
  end

  test "visiting the index" do
    visit exercise_sets_url
    assert_selector "h1", text: "Exercise sets"
  end

  test "should create exercise set" do
    visit exercise_sets_url
    click_on "New exercise set"

    click_on "Create Exercise set"

    assert_text "Exercise set was successfully created"
    click_on "Back"
  end

  test "should update Exercise set" do
    visit exercise_set_url(@exercise_set)
    click_on "Edit this exercise set", match: :first

    click_on "Update Exercise set"

    assert_text "Exercise set was successfully updated"
    click_on "Back"
  end

  test "should destroy Exercise set" do
    visit exercise_set_url(@exercise_set)
    click_on "Destroy this exercise set", match: :first

    assert_text "Exercise set was successfully destroyed"
  end
end
