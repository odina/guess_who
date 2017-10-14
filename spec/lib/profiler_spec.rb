require "spec_helper"

describe GuessWho::Profiler do
  it "should generate a guess for the name from an email with 1 word" do
    email = "john.doe@gmail.com"
    profiler = GuessWho::Profiler.profile!(email)

    puts "Running for #{email}..."

    profiler.full_name.should == "John Doe"
    profiler.email.should == "john.doe@gmail.com"
  end

  it "should extract all test names correctly" do
    test_names = {
      'christianbundy':      ['Christian', 'Bundy'],
      'emmitt.a.riggin':     ['Emmitt', 'A', 'Riggin'],
      'meghannyunker':       ['Meghann', 'Yunker'],
      'huechadwick':         ['Hue', 'Chadwick'],
      'delphia.a.kimmer':    ['Delphia', 'A', 'Kimmer'],
      'lilymendel':          ['Lily', 'Mendel'],
      'natisha.pedroza':     ['Natisha', 'Pedroza'],
      'leoramauch':          ['Leora', 'Mauch'],
      'jamika.mcgranahan':   ['Jamika', 'Mcgranahan'],
      'celestinachittenden': ['Celestina', 'Chittenden'],
      'jadacwalson':         ['Ja', 'Dac', 'Walson'],
      'denese.d.eichler':    ['Denese', 'D', 'Eichler'],
      'marybethgant':        ['Marybeth', 'Gant'],
      'ashleamondy':         ['Ashlea', 'Mondy'],
      'brittanynowakowski':  ['Brittany', 'Nowakowski'],
      'nelliersepeda':       ['Nellier', 'Sepeda'],
      'anastasia.matchett':  ['Anastasia', 'Matchett'],
      'glory.mclester':      ['Glory', 'Mclester'],
      'wilburn.f.hinkson':   ['Wilburn', 'F', 'Hinkson'],
      'grace.k.baham':       ['Grace', 'K', 'Baham'],
      'haroldcrick':         ['Harold', 'Crick']
    }

    test_names.each do |name, extracted|
      print  "Running for #{name}..."
      profiler = GuessWho::Profiler.profile!(name.to_s)
      print  " Got #{profiler.full_name}"
      puts "\n"
      profiler.full_name.should == extracted.join(" ")
    end
  end
end
