import React from "react";

interface GreeterProps {
  name: string;
}
const Greeter = (props: GreeterProps) => {
  return (
    <div>
      <h1>Hello {props.name}!</h1>
      <h1>Peace of mind with React.js and TypeScript.</h1>
    </div>
  );
};
export default Greeter;
