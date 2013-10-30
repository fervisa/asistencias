class CreateAlumnos < ActiveRecord::Migration
  def change
    create_table :alumnos do |t|
      t.string :nombre
      t.string :primer_apellido
      t.string :segundo_apellido
      t.string :responsable_nombre
      t.string :responsable_primer_apellido
      t.string :responsable_segundo_apellido

      t.timestamps
    end
  end
end
