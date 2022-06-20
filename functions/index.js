const functions = require("firebase-functions");
const admin = require("firebase-admin");

admin.initializeApp();

//List of all players
const namesList = ["Andy Isabella","Rodney Hudson","James Conner","Colt McCoy","Will Hernandez","Maxx Williams","Jalen Thompson","DeAndre Hopkins","Budda Baker","Zaven Collins","Matt Prater","Markus Golden","D.J. Humphries","Rondale Moore","Justin Pugh","Isaiah Simmons","Byron Murphy","Kelvin Beachum","J.J. Watt","Kyler Murray","Zach Ertz","Andy Lee","Darrel Williams","A.J. Green","Lorenzo Carter","AJ Terrell","Kyle Pitts","Richie Grant","Damiere Byrd","Auden Tate","Marcus Mariota","Damien Williams","Calvin Ridley","Casey Hayward","Deion Jones","Younghoe Koo","Matt Hennessy","Olamide Zaccheaus","Cordarrelle Patterson","Chris Lindstrom","Grady Jarrett","Jalen Mayfield","Mike Davis","Jake Matthews","Calais Campbell","Mark Andrews","Chuck Clark","Justin Tucker","Odafe Oweh","Tylan Wallace","Derek Wolfe","Gus Edwards","Marcus Peters","Sam Koch","Marcus Williams","Tyler Huntley","Nick Boyle","Michael Pierce","J.K. Dobbins","Ronnie Stanley","Tyus Bowser","Kevin Zeitler","Patrick Queen","Marlon Humphrey","Patrick Ricard","Miles Boykin","Devin Duvernay","Rashod Bateman","Lamar Jackson","Morgan Moses","Dane Jackson","DaQuan Jones","Tre'Davious White","Boogie Basham","Case Keenum","Josh Allen","Duke Johnson","Taron Johnson","A.J. Epenesa","Mitch Morse","Dion Dawkins","Dawson Knox","Isaiah McKenzie","Jamison Crowder","Matt Milano","Tremaine Edmunds","Shaq Lawson","O.J. Howard","Jordan Poyer","Stefon Diggs","Devin Singletary","Ed Oliver","Tyler Bass","Gregory Rousseau","Von Miller","Rodger Saffold","Zack Moss","Matt Barkley","Gabriel Davis","Micah Hyde","Spencer Brown","D'Onta Foreman","P.J. Walker","Matthew Ioannidis","Sam Darnold","Bradley Bozeman","Chuba Hubbard","Johnny Hekker","Cory Littleton","Shaq Thompson","Brady Christensen","Jeremy Chinn","Terrace Marshall Jr.","Rashard Higgins","Jaycee Horn","Derrick Brown","Donte Jackson","C.J. Henderson","Ameer Abdullah","Taylor Moton","Tommy Tremble","Xavier Woods","Zane Gonzalez","D.J. Moore","Yetur Gross-Matos","Brian Burns","Robby Anderson","Ian Thomas","Christian McCaffrey","Khalil Herbert","Cole Kmet","David Montgomery","Teven Jenkins","Roquan Smith","Robert Quinn","Cody Whitehair","Jaylon Johnson","Byron Pringle","Darnell Mooney","Nick Foles","Justin Fields","Cairo Santos","Trevor Siemian","Lucas Patrick","Darrynton Evans","Eddie Jackson","Logan Wilson","Drew Sample","Jonah Williams","Sam Hubbard","Hayden Hurst","La'el Collins","Joe Burrow","Trey Hendrickson","D.J. Reader","B.J. Hill","Chidobe Awuzie","Vonn Bell","Jackson Carman","Eli Apple","Tyler Boyd","Joe Mixon","Ted Karras","Tee Higgins","Jessie Bates III","Mike Hilton","Brandon Allen","Germaine Pratt","Evan McPherson","Alex Cappa","Samaje Perine","Chris Evans","Ja'Marr Chase","Amari Cooper","Joel Bitonio","Demetric Felton","Jack Conklin","Kareem Hunt","Chase McLaughlin","Anthony Walker","Grant Delpit","Greg Newsome II","Wyatt Teller","Baker Mayfield","Nick Chubb","Jeremiah Owusu-Koramoah","Jedrick Wills Jr.","Greedy Williams","Troy Hill","Chase Winovich","Jakeem Grant","John Johnson","David Njoku","Donovan Peoples-Jones","Anthony Schwartz","Ronnie Harrison","Myles Garrett","Jacoby Brissett","Denzel Ward","Deshaun Watson","D'Ernest Johnson","Harrison Bryant","Trevon Diggs","Connor McGovern","Tony Pollard","Malik Hooker","DeMarcus Lawrence","Kelvin Joseph","Cooper Rush","Zack Martin","Osa Odighizuwa","Anthony Brown","Dante Fowler","Bryan Anger","Jayron Kearse","Jourdan Lewis","James Washington","Dak Prescott","Dalton Schultz","Michael Gallup","CeeDee Lamb","Micah Parsons","Leighton Vander Esch","Ezekiel Elliott","Ben DiNucci","Tyler Biadasz","Kendall Hinton","Garett Bolles","Graham Glasgow","Tim Patrick","Justin Simmons","Russell Wilson","Dalton Risner","Patrick Surtain II","Randy Gregory","Albert Okwuegbunam","Brandon McManus","Bradley Chubb","Billy Turner","Sam Martin","Lloyd Cushenberry III","Javonte Williams","KJ Hamler","Quinn Meinerz","Dre'Mont Jones","Josey Jewell","Courtland Sutton","Ronald Darby","Jerry Jeudy","Levi Onwuzurike","Jamaal Williams","Derrick Barnes","Taylor Decker","Amon-Ra St. Brown","Michael Brockers","Quintez Cephus","Amani Oruwariye","Frank Ragnow","Jerry Jacobs","Josh Reynolds","Tracy Walker","Jack Fox","Jeff Okudah","Jarrad Davis","Alim McNeill","Halapoulivaati Vaitai","Alex Anzalone","Jared Goff","Penei Sewell","Romeo Okwara","T.J. Hockenson","DJ Chark","Jonah Jackson","D'Andre Swift","Tim Boyle","Kalif Raymond","Julian Okwara","Charles Harris","Aaron Rodgers","Dean Lowry","Jon Runyan","Josh Myers","De'Vondre Campbell","Aaron Jones","Randall Cobb","Eric Stokes","Royce Newman","Allen Lazard","Robert Tonyan","Adrian Amos","Rashan Gary","Marcedes Lewis","David Bakhtiari","Elgton Jenkins","Jarran Reed","Kenny Clark","Jaire Alexander","Mason Crosby","AJ Dillon","Darnell Savage Jr.","Amari Rodgers","Jordan Love","Preston Smith","Desmond King","Ka'imi Fairbairn","Marlon Mack","Davis Mills","Ross Blacklock","Laremy Tunsil","Tytus Howard","Brevin Jordan","Lonnie Johnson Jr.","Brandin Cooks","Jonathan Greenard","Nico Collins","Rex Burkhead","Michael Pittman Jr.","Khari Willis","Yannick Ngakoue","Kwity Paye","Sam Ehlinger","Ryan Kelly","Bobby Okereke","Isaiah Rodgers","Matt Ryan","Mo Alie-Cox","Jonathan Taylor","Julian Blackmon","Rodrigo Blankenship","Kenny Moore","Quenton Nelson","DeForest Buckner","Parris Campbell","Braden Smith","Nyheim Hines","Darius Leonard","Grover Stewart","Foyesade Oluokun","Laviska Shenault Jr.","Rayshawn Jenkins","Marvin Jones","James Robinson","K'Lavon Chaisson","Jawaan Taylor","Travis Etienne","Brandon Scherff","Zay Jones","Darious Williams","Cam Robinson","Tyson Campbell","Trevor Lawrence","Folorunso Fatukasi","Jamal Agnew","Dan Arnold","Shaquill Griffin","Josh Allen","Evan Engram","Christian Kirk","Matthew Wright","Patrick Mahomes","Ronald Jones II","Trey Smith","Frank Clark","Harrison Butker","Joe Thuney","Juan Thornhill","Nick Bolton","Clyde Edwards-Helaire","L'Jarius Sneed","JuJu Smith-Schuster","Willie Gay Jr.","Orlando Brown Jr.","Creed Humphrey","Rashad Fenton","Lucas Niang","Josh Gordon","Justin Reid","Travis Kelce","Marquez Valdes-Scantling","Chris Jones","Chad Henne","Clelin Ferrell","Darren Waller","Johnathan Abram","Jayon Brown","Hunter Renfrow","Maxx Crosby","Demarcus Robinson","Chandler Jones","Bryan Edwards","Josh Jacobs","Nick Mullens","Daniel Carlson","Denzelle Good","Foster Moreau","Johnathan Hankins","Derek Carr","Denzel Perryman","Kenyan Drake","Nate Hobbs","Alex Leatherwood","Rock Ya-Sin","Trayvon Mullen","Trevon Moehrig","Kyler Fackrell","Kolton Miller","Davante Adams","Divine Deablo","Anthony Averett","Chase Daniel","Derwin James","Asante Samuel Jr.","Dustin Hopkins","Mike Williams","Joey Bosa","Nasir Adderley","Khalil Mack","Matt Feiler","Donald Parham","Keenan Allen","Joshua Kelley","Rashawn Slater","Kenneth Murray","Josh Palmer","Michael Davis","Corey Linsley","Jerry Tillery","Jalen Guyton","J.C. Jackson","Austin Ekeler","Gerald Everett","Justin Herbert","Tyler Higbee","Allen Robinson","Leonard Floyd","Taylor Rapp","Cooper Kupp","Matt Gay","Darrell Henderson","A'Shawn Robinson","Ernest Jones","Bobby Wagner","Greg Gaines","Cam Akers","Tutu Atwell","Aaron Donald","Van Jefferson","Terrell Lewis","Brian Allen","Matthew Stafford","Jordan Fuller","Jalen Ramsey","Rob Havenstein","Tyreek Hill","Terron Armstead","Jaylen Waddle","Mike Gesicki","Emmanuel Ogbah","Tua Tagovailoa","Eric Rowe","Austin Jackson","Preston Williams","Jerome Baker","Jason Sanders","Byron Jones","Christian Wilkins","Alec Ingold","Andrew Van Ginkel","Raekwon Davis","Connor Williams","Cedrick Wilson Jr.","Raheem Mostert","Noah Igbinoghene","Robert Hunt","Teddy Bridgewater","Chase Edmonds","Xavien Howard","Adam Thielen","K.J. Osborn","Harrison Smith","Justin Jefferson","Jordan Hicks","Christian Darrisaw","Brian O'Neill","Kellen Mond","Dalvin Tomlinson","Dalvin Cook","C.J. Ham","Patrick Peterson","Greg Joseph","Garrett Bradbury","Alexander Mattison","Za'Darius Smith","Eric Kendricks","Danielle Hunter","Kirk Cousins","Cameron Dantzler","Ezra Cleveland","Chandon Sullivan","Irv Smith Jr.","Lawrence Guy","Jalen Mills","Trent Brown","Kyle Dugger","Mac Jones","Deatrich Wise Jr.","Isaiah Wynn","Christian Barmore","James White","Adrian Phillips","N'Keal Harry","Michael Onwenu","Jabrill Peppers","Jonathan Jones","Jarrett Stidham","Damien Harris","Kendrick Bourne","Rhamondre Stevenson","Davon Godchaux","Hunter Henry","Jakobi Meyers","Josh Uche","Devin McCourty","David Andrews","Matt Judon","Matthew Slater","Malcolm Butler","Brian Hoyer","Nick Folk","Nelson Agholor","Jonnu Smith","DeVante Parker","Paulson Adebo","David Onyemata","Pete Werner","Marquez Callaway","P.J. Williams","Taysom Hill","Adam Trautman","Cameron Jordan","Chauncey Gardner-Johnson","Marshon Lattimore","Zack Baun","Deonte Harris","Michael Thomas","Payton Turner","Marcus Davenport","Erik McCoy","Bradley Roby","Wil Lutz","Tre'Quan Smith","Andy Dalton","Ryan Ramczyk","Alvin Kamara","Cesar Ruiz","Andrus Peat","James Hurst","Demario Davis","Mark Ingram","Daniel Jones","Blake Martinez","Sterling Shepard","Leonard Williams","Dexter Lawrence","Jon Feliciano","Graham Gano","Kenny Golladay","Adoree' Jackson","Azeez Ojulari","Tyrod Taylor","Darius Slayton","Saquon Barkley","Julian Love","Andrew Thomas","Kadarius Toney","Matt Peart","Mark Glowinski","Xavier McKinney","Bryce Huff","D.J. Reed","Zach Wilson","Braxton Berrios","C.J. Uzomah","Sheldon Rankins","Tevin Coleman","Joe Flacco","Ashtyn Davis","Michael Carter","Mekhi Becton","Greg Zuerlein","Ty Johnson","Denzel Mims","Elijah Moore","C.J. Mosley","Alijah Vera-Tucker","Laken Tomlinson","Marcus Maye","John Franklin-Myers","Corey Davis","Carl Lawson","Bryce Hall","George Fant","Mike White","Connor McGovern","Jake Elliott","Jalen Reagor","Greg Ward","JJ Arcega-Whiteside","Jason Kelce","Darius Slay","Derek Barnett","DeVonta Smith","Lane Johnson","Javon Hargrave","Fletcher Cox","Jordan Mailata","Jalen Hurts","Josh Sweat","Landon Dickerson","Andre Dillard","Boston Scott","Zach Pascal","Avonte Maddox","Anthony Harris","Brandon Graham","Quez Watkins","Gardner Minshew II","Kenneth Gainwell","Dallas Goedert","Haason Reddick","Miles Sanders","Pat Freiermuth","Tyson Alualu","Minkah Fitzpatrick","Diontae Johnson","Levi Wallace","Alex Highsmith","Chris Boswell","Najee Harris","Chase Claypool","Myles Jack","James Daniels","Mitchell Trubisky","Derek Watt","Stephon Tuitt","Cameron Heyward","Chukwuma Okorafor","Ahkello Witherspoon","Devin Bush Jr.","Mason Rudolph","Cameron Sutton","Terrell Edmunds","T.J. Watt","Kevin Dotson","Charvarius Ward","Javon Kinlaw","Jimmie Ward","George Kittle","Jauan Jennings","Jimmy Garoppolo","Deebo Samuel","Trey Lance","Kyle Juszczyk","Dee Ford","Jeff Wilson","Fred Warner","Alex Mack","Ambry Thomas","Daniel Brunskill","Elijah Mitchell","Nick Bosa","Robbie Gould","Arik Armstead","Emmanuel Moseley","Trent Williams","Trey Sermon","Mike McGlinchey","Brandon Aiyuk","Kerry Hyder","Dre Greenlaw","Jacob Eason","Poona Ford","Chris Carson","Gabe Jackson","Jamal Adams","Marquise Blair","Shelby Harris","Rashaad Penny","Will Dissly","Uchenna Nwosu","Damien Lewis","DeeJay Dallas","D'Wayne Eskridge","Travis Homer","Sidney Jones","Darrell Taylor","D.K. Metcalf","Jason Myers","Quandre Diggs","Drew Lock","L.J. Collier","Noah Fant","Geno Smith","Michael Dickson","Tyler Lockett","Jordyn Brooks","Breshad Perriman","Kyle Trask","Rob Gronkowski","Giovani Bernard","Antoine Winfield Jr.","Jamel Dean","Carlton Davis","Devin White","Tom Brady","Russell Gage","Ryan Jensen","Vita Vea","Cameron Brate","Leonard Fournette","Scott Miller","Joe Tryon-Shoyinka","Tyler Johnson","Lavonte David","William Gholston","Shaq Mason","Mike Edwards","Chris Godwin","Mike Evans","Keanu Neal","Blaine Gabbert","Shaquil Barrett","Tristan Wirfs","Logan Ryan","Ryan Succop","Donovan Smith","Sean Murphy-Bunting","Elijah Molden","Taylor Lewan","Bud Dupree","David Long","Ryan Tannehill","Nick Westbrook-Ikhine","Harold Landry","Robert Woods","Derrick Henry","Dillon Radunz","Zach Cunningham","Austin Hooper","Brett Kern","Denico Autry","A.J. Brown","Amani Hooker","Anthony Firkser","Randy Bullock","Kristian Fulton","Kevin Byard","Jeffery Simmons","Dontrell Hilliard","Caleb Farley","Ben Jones","Daron Payne","Dyami Brown","J.D. McKissic","Taylor Heinicke","Charles Leno Jr.","Ricky Seals-Jones","Tress Way","Jonathan Allen","Jamin Davis","Curtis Samuel","Samuel Cosmi","Terry McLaurin","Bobby McCain","Kendall Fuller","Chase Young","Logan Thomas","Andrew Norwell","Antonio Gibson","Cole Holcomb","William Jackson III","Montez Sweat","Carson Wentz","Joey Slye","Kamren Curl","Chase Roullier"];


// // Create and Deploy Your First Cloud Functions
// // https://firebase.google.com/docs/functions/write-firebase-functions
//
exports.scheduledFunctionCrontab = functions.pubsub.schedule('0 0 * * *')
  .timeZone('America/New_York') // Users can choose timezone - default is America/Los_Angeles
  .onRun((context) => {


    var famousFound = false;

  //Get a random player
  //while(!famousFound){
    var random = namesList[Math.floor(Math.random()*namesList.length)];

return admin.firestore()
                .collection('Players')
                .doc(random)
                .get()
                .then(doc => {

/*
    console.log('Got famous: ' + doc.data().name+ doc.data().famous);
    if(String(doc.data().famous)==="true" || doc.data().famous===true){
        famousFound = true;
    }*/

    //Get information about player of the day
      var potd = {
          "name" : doc.data().name,
          "birthdate" : doc.data().birthdate,
          "conf" : doc.data().conf,
          "div" : doc.data().div,
          "famous" : doc.data().famous,
          "height" : doc.data().height,
          "number" : doc.data().number,
          "position" : doc.data().position,
          "team" : doc.data().team,

      }

      admin.firestore()
          .collection('Players')
          .doc('potd')
          .set(potd)

      console.log('Got Player: ' + doc.data().name);

    });

 // }

});


/*
 await firebase
          .firestore()
          .collection("Players")
          .where("id","==" , random)
          .limit(1)
          .get()
          .then((res)=>{
            let pack_data:any=[];
            res.forEach(quest=>{
              pack_data.push(quest.data());
            });
            resolve(pack_data[0]);

  //Set this random player to potd
    console.log(pack_data[0])


  return pack_data[0];
  */
