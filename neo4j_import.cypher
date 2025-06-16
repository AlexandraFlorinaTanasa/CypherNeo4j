// --- Clinic ---
CREATE (:Clinic {id: 1, name: 'Clinic1', address: 'Strada Teiului 1', phone: '0756652457', email: 'clinic1@email.com'});
CREATE (:Clinic {id: 2, name: 'Clinic2', address: 'Strada Zambetului 2', phone: '0728934352', email: 'clinic2@email.com'});
CREATE (:Clinic {id: 3, name: 'Clinic3', address: 'Piata Revolutiei 11', phone: '0729649360', email: 'clinic3@email.com'});
CREATE (:Clinic {id: 4, name: 'Clinic4', address: 'Calea Nationala 4', phone: '0747070607', email: 'clinic4@email.com'});
CREATE (:Clinic {id: 5, name: 'Clinic5', address: 'Strada Teatrului', phone: '0745920091', email: 'clinic5@email.com'});

// --- Supplier ---
CREATE (:Supplier {id: 1, name: 'Supplier1', address: 'Strada Ion Creanga 9', email: 'supplier1@email.com', phone: '0722993378'});
CREATE (:Supplier {id: 2, name: 'Supplier2', address: 'Strada Elena Farago 3', email: 'supplier2@email.com', phone: '0762894581'});
CREATE (:Supplier {id: 3, name: 'Supplier3', address: 'Strada Sperantei 4', email: 'supplier3@email.com', phone: '0734090248'});
CREATE (:Supplier {id: 4, name: 'Supplier4', address: 'Bulevardul Chimiei 51', email: 'supplier4@email.com', phone: '0766894488'});
CREATE (:Supplier {id: 5, name: 'Supplier5', address: 'Strada Lazar 5', email: 'supplier5@email.com', phone: '0755919662'});

// --- Client ---
CREATE (:Client {id: 1, firstName: 'Ana', lastName: 'Brasoveanu', email: 'anabr@gmail.com', phone: '0721886389', address: 'Strada Soarelui 2'});
CREATE (:Client {id: 2, firstName: 'Alin', lastName: 'Ursu', email: 'alinu@gmail.com', phone: '0756649012', address: 'Strada Norului 6'});
CREATE (:Client {id: 3, firstName: 'Andrei', lastName: 'Andries', email: 'andriesandu00@gmail.com', phone: '0766778190', address: 'Strada Ciumei 8'});
CREATE (:Client {id: 4, firstName: 'Miruna', lastName: 'Buza', email: 'mirub98@gmail.com', phone: '0789458911', address: 'Strada Ghinionului 7'});
CREATE (:Client {id: 5, firstName: 'Eduard', lastName: 'Schiopu', email: 'eduardedy98@gmail.com', phone: '0791884243', address: 'Strada Somnului 8'});

// --- Species ---
CREATE (:Species {id: 1, name: 'Canine'});
CREATE (:Species {id: 2, name: 'Feline'});
CREATE (:Species {id: 3, name: 'Avian'});
CREATE (:Species {id: 4, name: 'Reptile'});
CREATE (:Species {id: 5, name: 'Rodent'});

// --- Breed ---
CREATE (:Breed {id: 1, name: 'Breed1', speciesID: 1});
CREATE (:Breed {id: 2, name: 'Breed2', speciesID: 2});
CREATE (:Breed {id: 3, name: 'Breed3', speciesID: 3});
CREATE (:Breed {id: 4, name: 'Breed4', speciesID: 4});
CREATE (:Breed {id: 5, name: 'Breed5', speciesID: 5});

// --- Pet ---
CREATE (:Pet {id: 1, name: 'Pet1', dateOfBirth: date('2020-01-01'), microchipID: 'MICROCHIP1', clientID: 1, breedID: 1, weight: 7.32, gender: 'M', neutered: false});
CREATE (:Pet {id: 2, name: 'Pet2', dateOfBirth: date('2020-01-02'), microchipID: 'MICROCHIP2', clientID: 2, breedID: 2, weight: 15.47, gender: 'M', neutered: false});
CREATE (:Pet {id: 3, name: 'Pet3', dateOfBirth: date('2020-01-03'), microchipID: 'MICROCHIP3', clientID: 3, breedID: 3, weight: 12.88, gender: 'F', neutered: false});
CREATE (:Pet {id: 4, name: 'Pet4', dateOfBirth: date('2020-01-04'), microchipID: 'MICROCHIP4', clientID: 4, breedID: 4, weight: 6.54, gender: 'F', neutered: false});
CREATE (:Pet {id: 5, name: 'Pet5', dateOfBirth: date('2020-01-05'), microchipID: 'MICROCHIP5', clientID: 5, breedID: 5, weight: 20.75, gender: 'M', neutered: false});

// --- Veterinarian ---
CREATE (:Veterinarian {id: 1, firstName: 'Alice', lastName: 'Turcanu', email: 'alicet@gmail.com', phone: '0723622789', specialization: 'Surgery', clinicID: 1});
CREATE (:Veterinarian {id: 2, firstName: 'Mirabela', lastName: 'Gradinaru', email: 'mirag@gmail.com', phone: '0761893671', specialization: 'Surgery', clinicID: 2});
CREATE (:Veterinarian {id: 3, firstName: 'Eduard', lastName: 'Martinas', email: 'edygm@gmail.com', phone: '0746890182', specialization: 'Surgery', clinicID: 3});
CREATE (:Veterinarian {id: 4, firstName: 'Ana', lastName: 'Toma', email: 'anatoma@gmail.com', phone: '0755816303', specialization: 'Surgery', clinicID: 4});
CREATE (:Veterinarian {id: 5, firstName: 'Ela', lastName: 'Dumitru', email: 'eladumitru@gmail.com', phone: '0771008389', specialization: 'Surgery', clinicID: 5});

// --- RELATII ---
MATCH (c:Client {id: 1}), (p:Pet {id: 1}) CREATE (c)-[:OWNS]->(p);
MATCH (c:Client {id: 2}), (p:Pet {id: 2}) CREATE (c)-[:OWNS]->(p);
MATCH (c:Client {id: 3}), (p:Pet {id: 3}) CREATE (c)-[:OWNS]->(p);
MATCH (c:Client {id: 4}), (p:Pet {id: 4}) CREATE (c)-[:OWNS]->(p);
MATCH (c:Client {id: 5}), (p:Pet {id: 5}) CREATE (c)-[:OWNS]->(p);

MATCH (p:Pet {id: 1}), (b:Breed {id: 1}) CREATE (p)-[:IS_OF_BREED]->(b);
MATCH (p:Pet {id: 2}), (b:Breed {id: 2}) CREATE (p)-[:IS_OF_BREED]->(b);
MATCH (p:Pet {id: 3}), (b:Breed {id: 3}) CREATE (p)-[:IS_OF_BREED]->(b);
MATCH (p:Pet {id: 4}), (b:Breed {id: 4}) CREATE (p)-[:IS_OF_BREED]->(b);
MATCH (p:Pet {id: 5}), (b:Breed {id: 5}) CREATE (p)-[:IS_OF_BREED]->(b);

MATCH (b:Breed {id: 1}), (s:Species {id: 1}) CREATE (b)-[:IS_OF_SPECIES]->(s);
MATCH (b:Breed {id: 2}), (s:Species {id: 2}) CREATE (b)-[:IS_OF_SPECIES]->(s);
MATCH (b:Breed {id: 3}), (s:Species {id: 3}) CREATE (b)-[:IS_OF_SPECIES]->(s);
MATCH (b:Breed {id: 4}), (s:Species {id: 4}) CREATE (b)-[:IS_OF_SPECIES]->(s);
MATCH (b:Breed {id: 5}), (s:Species {id: 5}) CREATE (b)-[:IS_OF_SPECIES]->(s);

MATCH (v:Veterinarian {id: 1}), (cl:Clinic {id: 1}) CREATE (v)-[:WORKS_AT]->(cl);
MATCH (v:Veterinarian {id: 2}), (cl:Clinic {id: 2}) CREATE (v)-[:WORKS_AT]->(cl);
MATCH (v:Veterinarian {id: 3}), (cl:Clinic {id: 3}) CREATE (v)-[:WORKS_AT]->(cl);
MATCH (v:Veterinarian {id: 4}), (cl:Clinic {id: 4}) CREATE (v)-[:WORKS_AT]->(cl);
MATCH (v:Veterinarian {id: 5}), (cl:Clinic {id: 5}) CREATE (v)-[:WORKS_AT]->(cl);


// --- Appointment ---
CREATE (:Appointment {id: 1, date: date('2025-04-01'), time: time('09:00:00'), status: 'scheduled'});
CREATE (:Appointment {id: 2, date: date('2025-04-02'), time: time('11:00:00'), status: 'scheduled'});
CREATE (:Appointment {id: 3, date: date('2025-04-03'), time: time('12:00:00'), status: 'completed'});
CREATE (:Appointment {id: 4, date: date('2025-04-04'), time: time('10:00:00'), status: 'cancelled'});
CREATE (:Appointment {id: 5, date: date('2025-04-05'), time: time('09:00:00'), status: 'scheduled'});

// --- AppointmentService ---
CREATE (:AppointmentService {id: 1, name: 'Service1', description: 'Description1', baseFee: 110.00, durationMinutes: 30});
CREATE (:AppointmentService {id: 2, name: 'Service2', description: 'Description2', baseFee: 200.00, durationMinutes: 30});
CREATE (:AppointmentService {id: 3, name: 'Service3', description: 'Description3', baseFee: 250.00, durationMinutes: 30});
CREATE (:AppointmentService {id: 4, name: 'Service4', description: 'Description4', baseFee: 100.00, durationMinutes: 30});
CREATE (:AppointmentService {id: 5, name: 'Service5', description: 'Description5', baseFee: 50.00, durationMinutes: 30});

// --- AppointmentServiceLink ---
CREATE (:AppointmentServiceLink {id: 1, feeApplied: 250.00});
CREATE (:AppointmentServiceLink {id: 2, feeApplied: 550.00});
CREATE (:AppointmentServiceLink {id: 3, feeApplied: 200.00});
CREATE (:AppointmentServiceLink {id: 4, feeApplied: 450.00});
CREATE (:AppointmentServiceLink {id: 5, feeApplied: 60.00});

// --- Diagnosis ---
CREATE (:Diagnosis {id: 1, description: 'Diagnosis1'});
CREATE (:Diagnosis {id: 2, description: 'Diagnosis2'});
CREATE (:Diagnosis {id: 3, description: 'Diagnosis3'});
CREATE (:Diagnosis {id: 4, description: 'Diagnosis4'});
CREATE (:Diagnosis {id: 5, description: 'Diagnosis5'});

// --- Relații Appointment ---
MATCH (a:Appointment {id: 1}), (p:Pet {id: 1}) CREATE (a)-[:FOR_PET]->(p);
MATCH (a:Appointment {id: 1}), (v:Veterinarian {id: 1}) CREATE (a)-[:WITH_VET]->(v);
MATCH (a:Appointment {id: 1}), (c:Clinic {id: 1}) CREATE (a)-[:IN_CLINIC]->(c);

MATCH (a:Appointment {id: 2}), (p:Pet {id: 2}) CREATE (a)-[:FOR_PET]->(p);
MATCH (a:Appointment {id: 2}), (v:Veterinarian {id: 2}) CREATE (a)-[:WITH_VET]->(v);
MATCH (a:Appointment {id: 2}), (c:Clinic {id: 2}) CREATE (a)-[:IN_CLINIC]->(c);

MATCH (a:Appointment {id: 3}), (p:Pet {id: 3}) CREATE (a)-[:FOR_PET]->(p);
MATCH (a:Appointment {id: 3}), (v:Veterinarian {id: 3}) CREATE (a)-[:WITH_VET]->(v);
MATCH (a:Appointment {id: 3}), (c:Clinic {id: 3}) CREATE (a)-[:IN_CLINIC]->(c);

MATCH (a:Appointment {id: 4}), (p:Pet {id: 4}) CREATE (a)-[:FOR_PET]->(p);
MATCH (a:Appointment {id: 4}), (v:Veterinarian {id: 4}) CREATE (a)-[:WITH_VET]->(v);
MATCH (a:Appointment {id: 4}), (c:Clinic {id: 4}) CREATE (a)-[:IN_CLINIC]->(c);

MATCH (a:Appointment {id: 5}), (p:Pet {id: 5}) CREATE (a)-[:FOR_PET]->(p);
MATCH (a:Appointment {id: 5}), (v:Veterinarian {id: 5}) CREATE (a)-[:WITH_VET]->(v);
MATCH (a:Appointment {id: 5}), (c:Clinic {id: 5}) CREATE (a)-[:IN_CLINIC]->(c);

// --- Relații AppointmentServiceLink ---
MATCH (asl:AppointmentServiceLink {id: 1}), (a:Appointment {id: 1}) CREATE (asl)-[:LINKED_TO_APPOINTMENT]->(a);
MATCH (asl:AppointmentServiceLink {id: 1}), (s:AppointmentService {id: 1}) CREATE (asl)-[:PROVIDES_SERVICE]->(s);

MATCH (asl:AppointmentServiceLink {id: 2}), (a:Appointment {id: 2}) CREATE (asl)-[:LINKED_TO_APPOINTMENT]->(a);
MATCH (asl:AppointmentServiceLink {id: 2}), (s:AppointmentService {id: 2}) CREATE (asl)-[:PROVIDES_SERVICE]->(s);

MATCH (asl:AppointmentServiceLink {id: 3}), (a:Appointment {id: 3}) CREATE (asl)-[:LINKED_TO_APPOINTMENT]->(a);
MATCH (asl:AppointmentServiceLink {id: 3}), (s:AppointmentService {id: 3}) CREATE (asl)-[:PROVIDES_SERVICE]->(s);

MATCH (asl:AppointmentServiceLink {id: 4}), (a:Appointment {id: 4}) CREATE (asl)-[:LINKED_TO_APPOINTMENT]->(a);
MATCH (asl:AppointmentServiceLink {id: 4}), (s:AppointmentService {id: 4}) CREATE (asl)-[:PROVIDES_SERVICE]->(s);

MATCH (asl:AppointmentServiceLink {id: 5}), (a:Appointment {id: 5}) CREATE (asl)-[:LINKED_TO_APPOINTMENT]->(a);
MATCH (asl:AppointmentServiceLink {id: 5}), (s:AppointmentService {id: 5}) CREATE (asl)-[:PROVIDES_SERVICE]->(s);

// --- Relații Diagnosis ---
MATCH (d:Diagnosis {id: 1}), (a:Appointment {id: 1}) CREATE (d)-[:DIAGNOSED_AT]->(a);
MATCH (d:Diagnosis {id: 2}), (a:Appointment {id: 2}) CREATE (d)-[:DIAGNOSED_AT]->(a);
MATCH (d:Diagnosis {id: 3}), (a:Appointment {id: 3}) CREATE (d)-[:DIAGNOSED_AT]->(a);
MATCH (d:Diagnosis {id: 4}), (a:Appointment {id: 4}) CREATE (d)-[:DIAGNOSED_AT]->(a);
MATCH (d:Diagnosis {id: 5}), (a:Appointment {id: 5}) CREATE (d)-[:DIAGNOSED_AT]->(a);


// --- TreatmentPlan ---
CREATE (:TreatmentPlan {id: 1, description: 'Plan1', isActive: true});
CREATE (:TreatmentPlan {id: 2, description: 'Plan2', isActive: true});
CREATE (:TreatmentPlan {id: 3, description: 'Plan3', isActive: true});
CREATE (:TreatmentPlan {id: 4, description: 'Plan4', isActive: true});
CREATE (:TreatmentPlan {id: 5, description: 'Plan5', isActive: true});

// --- PrescribedTreatment ---
CREATE (:PrescribedTreatment {id: 1, name: 'Treatment1', dosage: 2});
CREATE (:PrescribedTreatment {id: 2, name: 'Treatment2', dosage: 2});
CREATE (:PrescribedTreatment {id: 3, name: 'Treatment3', dosage: 2});
CREATE (:PrescribedTreatment {id: 4, name: 'Treatment4', dosage: 2});
CREATE (:PrescribedTreatment {id: 5, name: 'Treatment5', dosage: 2});

// --- AdministeredTreatment ---
CREATE (:AdministeredTreatment {id: 1, dateAdministered: date('2025-05-01'), location: 'clinic'});
CREATE (:AdministeredTreatment {id: 2, dateAdministered: date('2025-05-02'), location: 'clinic'});
CREATE (:AdministeredTreatment {id: 3, dateAdministered: date('2025-05-03'), location: 'clinic'});
CREATE (:AdministeredTreatment {id: 4, dateAdministered: date('2025-05-04'), location: 'clinic'});
CREATE (:AdministeredTreatment {id: 5, dateAdministered: date('2025-05-05'), location: 'clinic'});

// --- TreatmentClinic ---
CREATE (:TreatmentClinic {id: 1});
CREATE (:TreatmentClinic {id: 2});
CREATE (:TreatmentClinic {id: 3});
CREATE (:TreatmentClinic {id: 4});
CREATE (:TreatmentClinic {id: 5});

// --- HomeTreatment ---
CREATE (:HomeTreatment {id: 1, address: 'Strada Restantei 1'});
CREATE (:HomeTreatment {id: 2, address: 'Calea nationala 75'});
CREATE (:HomeTreatment {id: 3, address: 'Bulevardul Stefan cel Mare 11'});
CREATE (:HomeTreatment {id: 4, address: 'Strada Vasile Lupu 5'});
CREATE (:HomeTreatment {id: 5, address: 'Strada Unirii 2'});

// --- Relații PrescribedTreatment ---
MATCH (t:PrescribedTreatment {id: 1}), (p:Product {id: 1}) CREATE (t)-[:USES_PRODUCT]->(p);
MATCH (t:PrescribedTreatment {id: 1}), (a:Appointment {id: 1}) CREATE (t)-[:FOR_APPOINTMENT]->(a);
MATCH (t:PrescribedTreatment {id: 1}), (pl:TreatmentPlan {id: 1}) CREATE (t)-[:PART_OF_PLAN]->(pl);

MATCH (t:PrescribedTreatment {id: 2}), (p:Product {id: 2}) CREATE (t)-[:USES_PRODUCT]->(p);
MATCH (t:PrescribedTreatment {id: 2}), (a:Appointment {id: 2}) CREATE (t)-[:FOR_APPOINTMENT]->(a);
MATCH (t:PrescribedTreatment {id: 2}), (pl:TreatmentPlan {id: 2}) CREATE (t)-[:PART_OF_PLAN]->(pl);

MATCH (t:PrescribedTreatment {id: 3}), (p:Product {id: 3}) CREATE (t)-[:USES_PRODUCT]->(p);
MATCH (t:PrescribedTreatment {id: 3}), (a:Appointment {id: 3}) CREATE (t)-[:FOR_APPOINTMENT]->(a);
MATCH (t:PrescribedTreatment {id: 3}), (pl:TreatmentPlan {id: 3}) CREATE (t)-[:PART_OF_PLAN]->(pl);

MATCH (t:PrescribedTreatment {id: 4}), (p:Product {id: 4}) CREATE (t)-[:USES_PRODUCT]->(p);
MATCH (t:PrescribedTreatment {id: 4}), (a:Appointment {id: 4}) CREATE (t)-[:FOR_APPOINTMENT]->(a);
MATCH (t:PrescribedTreatment {id: 4}), (pl:TreatmentPlan {id: 4}) CREATE (t)-[:PART_OF_PLAN]->(pl);

MATCH (t:PrescribedTreatment {id: 5}), (p:Product {id: 5}) CREATE (t)-[:USES_PRODUCT]->(p);
MATCH (t:PrescribedTreatment {id: 5}), (a:Appointment {id: 5}) CREATE (t)-[:FOR_APPOINTMENT]->(a);
MATCH (t:PrescribedTreatment {id: 5}), (pl:TreatmentPlan {id: 5}) CREATE (t)-[:PART_OF_PLAN]->(pl);

// --- Relații AdministeredTreatment ---
MATCH (a:AdministeredTreatment {id: 1}), (p:PrescribedTreatment {id: 1}) CREATE (a)-[:ADMINISTERS]->(p);
MATCH (a:AdministeredTreatment {id: 2}), (p:PrescribedTreatment {id: 2}) CREATE (a)-[:ADMINISTERS]->(p);
MATCH (a:AdministeredTreatment {id: 3}), (p:PrescribedTreatment {id: 3}) CREATE (a)-[:ADMINISTERS]->(p);
MATCH (a:AdministeredTreatment {id: 4}), (p:PrescribedTreatment {id: 4}) CREATE (a)-[:ADMINISTERS]->(p);
MATCH (a:AdministeredTreatment {id: 5}), (p:PrescribedTreatment {id: 5}) CREATE (a)-[:ADMINISTERS]->(p);

// --- Relații TreatmentClinic ---
MATCH (tc:TreatmentClinic {id: 1}), (a:AdministeredTreatment {id: 1}) CREATE (tc)-[:PERFORMED_AT]->(a);
MATCH (tc:TreatmentClinic {id: 1}), (c:Clinic {id: 1}) CREATE (tc)-[:IN_CLINIC]->(c);

MATCH (tc:TreatmentClinic {id: 2}), (a:AdministeredTreatment {id: 2}) CREATE (tc)-[:PERFORMED_AT]->(a);
MATCH (tc:TreatmentClinic {id: 2}), (c:Clinic {id: 2}) CREATE (tc)-[:IN_CLINIC]->(c);

MATCH (tc:TreatmentClinic {id: 3}), (a:AdministeredTreatment {id: 3}) CREATE (tc)-[:PERFORMED_AT]->(a);
MATCH (tc:TreatmentClinic {id: 3}), (c:Clinic {id: 3}) CREATE (tc)-[:IN_CLINIC]->(c);

MATCH (tc:TreatmentClinic {id: 4}), (a:AdministeredTreatment {id: 4}) CREATE (tc)-[:PERFORMED_AT]->(a);
MATCH (tc:TreatmentClinic {id: 4}), (c:Clinic {id: 4}) CREATE (tc)-[:IN_CLINIC]->(c);

MATCH (tc:TreatmentClinic {id: 5}), (a:AdministeredTreatment {id: 5}) CREATE (tc)-[:PERFORMED_AT]->(a);
MATCH (tc:TreatmentClinic {id: 5}), (c:Clinic {id: 5}) CREATE (tc)-[:IN_CLINIC]->(c);

// --- Relații HomeTreatment ---
MATCH (ht:HomeTreatment {id: 1}), (a:AdministeredTreatment {id: 1}) CREATE (ht)-[:PERFORMED_AT_HOME]->(a);
MATCH (ht:HomeTreatment {id: 2}), (a:AdministeredTreatment {id: 2}) CREATE (ht)-[:PERFORMED_AT_HOME]->(a);
MATCH (ht:HomeTreatment {id: 3}), (a:AdministeredTreatment {id: 3}) CREATE (ht)-[:PERFORMED_AT_HOME]->(a);
MATCH (ht:HomeTreatment {id: 4}), (a:AdministeredTreatment {id: 4}) CREATE (ht)-[:PERFORMED_AT_HOME]->(a);
MATCH (ht:HomeTreatment {id: 5}), (a:AdministeredTreatment {id: 5}) CREATE (ht)-[:PERFORMED_AT_HOME]->(a);


// --- Discount ---
CREATE (:Discount {id: 1, name: 'Discount1', description: 'Discount Desc 1', percentage: 10.00, startDate: date('2025-01-01'), endDate: date('2025-12-31'), isActive: true});
CREATE (:Discount {id: 2, name: 'Discount2', description: 'Discount Desc 2', percentage: 10.00, startDate: date('2025-01-01'), endDate: date('2025-12-31'), isActive: true});
CREATE (:Discount {id: 3, name: 'Discount3', description: 'Discount Desc 3', percentage: 10.00, startDate: date('2025-01-01'), endDate: date('2025-12-31'), isActive: true});
CREATE (:Discount {id: 4, name: 'Discount4', description: 'Discount Desc 4', percentage: 10.00, startDate: date('2025-01-01'), endDate: date('2025-12-31'), isActive: true});
CREATE (:Discount {id: 5, name: 'Discount5', description: 'Discount Desc 5', percentage: 10.00, startDate: date('2025-01-01'), endDate: date('2025-12-31'), isActive: true});

// --- Invoice ---
CREATE (:Invoice {id: 1, totalAmount: 200.00});
CREATE (:Invoice {id: 2, totalAmount: 200.00});
CREATE (:Invoice {id: 3, totalAmount: 100.00});
CREATE (:Invoice {id: 4, totalAmount: 150.00});
CREATE (:Invoice {id: 5, totalAmount: 170.00});

// --- InvoiceLine ---
CREATE (:InvoiceLine {id: 1, description: 'Line Description 1', quantity: 2, unitPrice: 225.00});
CREATE (:InvoiceLine {id: 2, description: 'Line Description 2', quantity: 2, unitPrice: 250.00});
CREATE (:InvoiceLine {id: 3, description: 'Line Description 3', quantity: 2, unitPrice: 20.00});
CREATE (:InvoiceLine {id: 4, description: 'Line Description 4', quantity: 2, unitPrice: 250.00});
CREATE (:InvoiceLine {id: 5, description: 'Line Description 5', quantity: 2, unitPrice: 158.00});

// --- Payment ---
CREATE (:Payment {id: 1, paymentDate: date('2025-05-01'), paymentMethod: 'card', amount: 50.00});
CREATE (:Payment {id: 2, paymentDate: date('2025-05-02'), paymentMethod: 'card', amount: 100.00});
CREATE (:Payment {id: 3, paymentDate: date('2025-05-03'), paymentMethod: 'cash', amount: 75.00});
CREATE (:Payment {id: 4, paymentDate: date('2025-05-04'), paymentMethod: 'card', amount: 70.00});
CREATE (:Payment {id: 5, paymentDate: date('2025-05-05'), paymentMethod: 'cash', amount: 60.00});

// --- Relații Invoice ---
MATCH (i:Invoice {id: 1}), (a:Appointment {id: 1}) CREATE (i)-[:FOR_APPOINTMENT]->(a);
MATCH (i:Invoice {id: 1}), (d:Discount {id: 1}) CREATE (i)-[:HAS_DISCOUNT]->(d);

MATCH (i:Invoice {id: 2}), (a:Appointment {id: 2}) CREATE (i)-[:FOR_APPOINTMENT]->(a);
MATCH (i:Invoice {id: 2}), (d:Discount {id: 2}) CREATE (i)-[:HAS_DISCOUNT]->(d);

MATCH (i:Invoice {id: 3}), (a:Appointment {id: 3}) CREATE (i)-[:FOR_APPOINTMENT]->(a);
MATCH (i:Invoice {id: 3}), (d:Discount {id: 3}) CREATE (i)-[:HAS_DISCOUNT]->(d);

MATCH (i:Invoice {id: 4}), (a:Appointment {id: 4}) CREATE (i)-[:FOR_APPOINTMENT]->(a);
MATCH (i:Invoice {id: 4}), (d:Discount {id: 4}) CREATE (i)-[:HAS_DISCOUNT]->(d);

MATCH (i:Invoice {id: 5}), (a:Appointment {id: 5}) CREATE (i)-[:FOR_APPOINTMENT]->(a);
MATCH (i:Invoice {id: 5}), (d:Discount {id: 5}) CREATE (i)-[:HAS_DISCOUNT]->(d);

// --- Relații InvoiceLine ---
MATCH (il:InvoiceLine {id: 1}), (i:Invoice {id: 1}) CREATE (il)-[:PART_OF]->(i);
MATCH (il:InvoiceLine {id: 2}), (i:Invoice {id: 2}) CREATE (il)-[:PART_OF]->(i);
MATCH (il:InvoiceLine {id: 3}), (i:Invoice {id: 3}) CREATE (il)-[:PART_OF]->(i);
MATCH (il:InvoiceLine {id: 4}), (i:Invoice {id: 4}) CREATE (il)-[:PART_OF]->(i);
MATCH (il:InvoiceLine {id: 5}), (i:Invoice {id: 5}) CREATE (il)-[:PART_OF]->(i);

// --- Relații Payment ---
MATCH (p:Payment {id: 1}), (i:Invoice {id: 1}) CREATE (p)-[:PAYS_FOR]->(i);
MATCH (p:Payment {id: 2}), (i:Invoice {id: 2}) CREATE (p)-[:PAYS_FOR]->(i);
MATCH (p:Payment {id: 3}), (i:Invoice {id: 3}) CREATE (p)-[:PAYS_FOR]->(i);
MATCH (p:Payment {id: 4}), (i:Invoice {id: 4}) CREATE (p)-[:PAYS_FOR]->(i);
MATCH (p:Payment {id: 5}), (i:Invoice {id: 5}) CREATE (p)-[:PAYS_FOR]->(i);


// --- MedicalHistory ---
CREATE (:MedicalHistory {id: 1, dateOfRecord: date('2025-05-01'), type: 'diagnosis', description: 'History Description 1'});
CREATE (:MedicalHistory {id: 2, dateOfRecord: date('2025-05-02'), type: 'diagnosis', description: 'History Description 2'});
CREATE (:MedicalHistory {id: 3, dateOfRecord: date('2025-05-03'), type: 'diagnosis', description: 'History Description 3'});
CREATE (:MedicalHistory {id: 4, dateOfRecord: date('2025-05-04'), type: 'diagnosis', description: 'History Description 4'});
CREATE (:MedicalHistory {id: 5, dateOfRecord: date('2025-05-05'), type: 'diagnosis', description: 'History Description 5'});

// --- Relații MedicalHistory ---
MATCH (h:MedicalHistory {id: 1}), (p:Pet {id: 1}) CREATE (h)-[:BELONGS_TO]->(p);
MATCH (h:MedicalHistory {id: 2}), (p:Pet {id: 2}) CREATE (h)-[:BELONGS_TO]->(p);
MATCH (h:MedicalHistory {id: 3}), (p:Pet {id: 3}) CREATE (h)-[:BELONGS_TO]->(p);
MATCH (h:MedicalHistory {id: 4}), (p:Pet {id: 4}) CREATE (h)-[:BELONGS_TO]->(p);
MATCH (h:MedicalHistory {id: 5}), (p:Pet {id: 5}) CREATE (h)-[:BELONGS_TO]->(p);

// --- SupplyEntry ---
CREATE (:SupplyEntry {id: 1, dateReceived: date('2025-04-01'), quantity: 50, pricePerUnit: 15.00});
CREATE (:SupplyEntry {id: 2, dateReceived: date('2025-04-02'), quantity: 50, pricePerUnit: 20.00});
CREATE (:SupplyEntry {id: 3, dateReceived: date('2025-04-03'), quantity: 50, pricePerUnit: 17.00});
CREATE (:SupplyEntry {id: 4, dateReceived: date('2025-04-04'), quantity: 50, pricePerUnit: 25.00});
CREATE (:SupplyEntry {id: 5, dateReceived: date('2025-04-05'), quantity: 50, pricePerUnit: 10.00});

// --- Relații SupplyEntry ---
MATCH (se:SupplyEntry {id: 1}), (p:Product {id: 1}) CREATE (se)-[:FOR_PRODUCT]->(p);
MATCH (se:SupplyEntry {id: 1}), (s:Supplier {id: 1}) CREATE (se)-[:FROM_SUPPLIER]->(s);

MATCH (se:SupplyEntry {id: 2}), (p:Product {id: 2}) CREATE (se)-[:FOR_PRODUCT]->(p);
MATCH (se:SupplyEntry {id: 2}), (s:Supplier {id: 2}) CREATE (se)-[:FROM_SUPPLIER]->(s);

MATCH (se:SupplyEntry {id: 3}), (p:Product {id: 3}) CREATE (se)-[:FOR_PRODUCT]->(p);
MATCH (se:SupplyEntry {id: 3}), (s:Supplier {id: 3}) CREATE (se)-[:FROM_SUPPLIER]->(s);

MATCH (se:SupplyEntry {id: 4}), (p:Product {id: 4}) CREATE (se)-[:FOR_PRODUCT]->(p);
MATCH (se:SupplyEntry {id: 4}), (s:Supplier {id: 4}) CREATE (se)-[:FROM_SUPPLIER]->(s);

MATCH (se:SupplyEntry {id: 5}), (p:Product {id: 5}) CREATE (se)-[:FOR_PRODUCT]->(p);
MATCH (se:SupplyEntry {id: 5}), (s:Supplier {id: 5}) CREATE (se)-[:FROM_SUPPLIER]->(s);

//Supplier
CREATE (:Supplier {id: 1, name: 'Supplier1', address: 'Strada Ion Creanga 9', email: 'supplier1@email.com', phone: '0722993378'});
CREATE (:Supplier {id: 2, name: 'Supplier2', address: 'Strada Elena Farago 3', email: 'supplier2@email.com', phone: '0762894581'});
CREATE (:Supplier {id: 3, name: 'Supplier3', address: 'Strada Sperantei 4', email: 'supplier3@email.com', phone: '0734090248'});
CREATE (:Supplier {id: 4, name: 'Supplier4', address: 'Bulevardul Chimiei 51', email: 'supplier4@email.com', phone: '0766894488'});
CREATE (:Supplier {id: 5, name: 'Supplier5', address: 'Strada Lazar 5', email: 'supplier5@email.com', phone: '0755919662'});


//Product
CREATE (:Product {id: 1, name: 'Product1', price: 20.00, stock: 100, lotNumber: 'LOT1', expiryDate: date('2026-12-31'), reorderThreshold: 10, storageCondition: 'room temperature'});
CREATE (:Product {id: 2, name: 'Product2', price: 20.00, stock: 100, lotNumber: 'LOT2', expiryDate: date('2026-12-31'), reorderThreshold: 10, storageCondition: 'room temperature'});
CREATE (:Product {id: 3, name: 'Product3', price: 20.00, stock: 100, lotNumber: 'LOT3', expiryDate: date('2026-12-31'), reorderThreshold: 10, storageCondition: 'room temperature'});
CREATE (:Product {id: 4, name: 'Product4', price: 20.00, stock: 100, lotNumber: 'LOT4', expiryDate: date('2026-12-31'), reorderThreshold: 10, storageCondition: 'room temperature'});
CREATE (:Product {id: 5, name: 'Product5', price: 20.00, stock: 100, lotNumber: 'LOT5', expiryDate: date('2026-12-31'), reorderThreshold: 10, storageCondition: 'room temperature'});

MATCH (se:SupplyEntry {id: 1}), (p:Product {id: 1}) CREATE (se)-[:FOR_PRODUCT]->(p);
MATCH (se:SupplyEntry {id: 1}), (s:Supplier {id: 1}) CREATE (se)-[:FROM_SUPPLIER]->(s);

MATCH (se:SupplyEntry {id: 2}), (p:Product {id: 2}) CREATE (se)-[:FOR_PRODUCT]->(p);
MATCH (se:SupplyEntry {id: 2}), (s:Supplier {id: 2}) CREATE (se)-[:FROM_SUPPLIER]->(s);

MATCH (se:SupplyEntry {id: 3}), (p:Product {id: 3}) CREATE (se)-[:FOR_PRODUCT]->(p);
MATCH (se:SupplyEntry {id: 3}), (s:Supplier {id: 3}) CREATE (se)-[:FROM_SUPPLIER]->(s);

MATCH (se:SupplyEntry {id: 4}), (p:Product {id: 4}) CREATE (se)-[:FOR_PRODUCT]->(p);
MATCH (se:SupplyEntry {id: 4}), (s:Supplier {id: 4}) CREATE (se)-[:FROM_SUPPLIER]->(s);

MATCH (se:SupplyEntry {id: 5}), (p:Product {id: 5}) CREATE (se)-[:FOR_PRODUCT]->(p);
MATCH (se:SupplyEntry {id: 5}), (s:Supplier {id: 5}) CREATE (se)-[:FROM_SUPPLIER]->(s);
