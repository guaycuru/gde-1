require 'spec_helper'

describe CourseMech do

  describe 'CourseMech scrapping MC404 at Second Semester' do

    subject { CourseMech.new(:second_semester, 'MC404') }

    # Expected values
    let(:year) { 2014 }
    let(:title) { 'MC404 Organização Básica de Computadores e Linguagem de Montagem' }
    let(:credits) { 4 }
    let(:dac_page) { 'http://www.dac.unicamp.br/sistemas/horarios/grad/G2S0/MC404.htm' }
    let(:overview) { 'Introdução à organização de computadores e representação de informação na memória. Estudo do conjunto de instruções de processadores RISCs e CISCs. Desenvolvimento, implementação e testes de programas usando linguagens e montagem.' }
    let(:dac_url_period_param) { 'G2S0' }
    let(:vacancies) { [25, 25, 30, 25, 25] }
    let(:offering_codes) { ['A', 'B', 'C', 'E', 'F'] }
    let(:professor_names) { ['Diego De Freitas Aranha', 'Diego De Freitas Aranha', 'Célio Cardoso Guimarães', 'Edson Borin', 'Edson Borin'] }
  
    it '#dac_url_period_param' do
      subject.dac_url_period_param.must_equal dac_url_period_param
    end

    it '#dac_page' do
      subject.dac_page.must_equal dac_page
    end

    it '#title' do
      subject.title.must_equal title
    end

    it '#credits' do
      subject.credits.must_equal credits
    end

    it '#overview' do
      subject.overview.must_equal overview
    end

    it '#year' do
      subject.year.must_equal year
    end

    it '#offering_codes' do
      subject.offering_codes.must_equal offering_codes
    end

    it '#vacancies' do
      subject.vacancies.must_equal vacancies
    end

    it '#professor_names' do
      subject.professor_names.must_equal professor_names
    end

    it '#course' do
      subject.course.must_be_kind_of Course
      subject.course.code.wont_be_nil
      subject.course.title.wont_be_nil
      subject.course.overview.wont_be_nil
    end

    it '#professors' do
      subject.professors.must_be_kind_of Enumerable
      subject.professors.each do |professor|
        professor.must_be_kind_of Professor
        professor.name.wont_be_nil
      end
    end

    it '#offerings' do
      subject.offerings.must_be_kind_of Enumerable
      subject.offerings.each do |offering|
        offering.must_be_kind_of Offering
        offering.code.wont_be_nil
        offering.term.wont_be_nil
        offering.year.wont_be_nil
        offering.course.wont_be_nil
        offering.credits.wont_be_nil
        offering.professor.wont_be_nil
        offering.min_enrolled_students.wont_be_nil
        offering.max_enrolled_students.wont_be_nil
      end
    end
  end
end
