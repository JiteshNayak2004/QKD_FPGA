module BB84_tb();
  reg a;
  reg b;
  reg b1;
  reg spy;
  wire [1:0] qubit;
  wire a1;
  wire error;
  
  top_module instance1(.a(a),
                     .b(b),
                       .b1(b1),
                     .a1(a1),
                       .spy(spy),
                       .error(error),
                       .qubit(qubit));
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
  end
  // bit a refer's to alice's ------bit b refers to alice's basis choice -----and b1 refer's to bob's basis choice
  //the qubit signal tell's the choice of basis as there are 4 bases
  // a1 is bob's measured output
  initial
    begin
      a  <= 1;
      b  <= 0;
      b1 <= 0;
      spy = 0;
      #20;
      $display("bob's meaurement = %b for Alice's(data,basis)= %b and bob's basis= %b", a1, qubit, b1);
      a  <= 1;
      b  <= 1;
      b1 <= 0;
      #20;
      $display("bob's meaurement = %b for Alice's(data,basis)= %b and bob's basis = %b", a1, qubit, b1);
      a  <= 0;
      b  <= 0;
      b1 <= 1;
      #20;
      $display("bob's meaurement = %b for Alice's(data,basis)= %b and bob's basis = %b", a1, qubit, b1);
      a  <= 0;
      b  <= 1;
      b1 <= 1;
      #20;
      $display("bob's meaurement = %b for Alice's(data,basis)= %b and bob's basis = %b", a1, qubit, b1);
      a  <= 1;
      b  <= 0;
      b1 <= 0;
      #20;
      $display("bob's meaurement = %b for Alice's(data,basis)= %b and bob's basis = %b", a1, qubit, b1);
      a  <= 1;
      b  <= 1;
      b1 <= 0;
      #20;
      $display("bob's meaurement = %b for Alice's(data,basis)= %b and bob's basis = %b", a1, qubit, b1);
    $finish;
    end
endmodule